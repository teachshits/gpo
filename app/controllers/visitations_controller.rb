class VisitationsController < ApplicationController

  before_filter :find_context
  filter_access_to :index do
    permitted_to!(:read, @project) if @context == 'project'
    permitted_to!(:read, @chair) if @context == 'chair'
    permitted_to!(:read, :visitations) if @context == 'application'
    true
  end
  filter_access_to [:edit, :update], :require => :update, :context => :projects, :attribute_check => true

  def index
    render @context, :layout => @context
  end

  def edit
    @errors = []
    @gpoday = Gpoday.find(params[:id])
    render :layout => 'project'
  end

  def update
    @errors = []
    @gpoday = Gpoday.find(params[:id])
    params[:participant].each do |participant_with_rate|
      participant = @project.participants.find(participant_with_rate[0])
      visitation = participant.visitation_for_gpoday(@gpoday)
      visitation.rate = participant_with_rate[1].gsub(",", ".")
      unless visitation.save
        @errors << participant.id
      end
    end
    if @errors.empty?
      flash[:notice] = "Баллы сохранены"
      redirect_to chair_project_visitations_path(@project.chair, @project)
    else
      flash[:error] = "Ошибка сохранения баллов"
      render :action => :edit, :layout => 'project'
    end
  end

  protected
  def find_context
    @context = 'application'
    @chair = Chair.find_by_id(params[:chair_id])
    @context = 'chair' if @chair
    @project = Project.find_by_id(params[:project_id])
    @context = 'project' if @project
  end

  def find_visitation
    @visitation = Visitation.find(params[:id])
  end

end

