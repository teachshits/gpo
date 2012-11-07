# encoding: utf-8

class Manage::ParticipantsController < Manage::ApplicationController
  inherit_resources

  belongs_to :chair, :project

  actions :all, :except => :destroy

  helper_method :finded_participants

  layout :resolve_layout

  def create
    create! { collection_path }
  end

  private

  def finded_participants
    @finded_participants ||= Participant.contingent_find(params[:search] || {})
  end

  def resolve_layout
    return false if ['edit', 'update', 'show'].include?(action_name)

    'project'
  end
end
