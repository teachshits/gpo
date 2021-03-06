# encoding: utf-8

class Manage::UsersController < Manage::InheritedResourcesController
  belongs_to :chair, optional: true

  actions :all, except: :show

  expose(:chair)

  layout :choose_layout

  def choose_layout
    @chair.nil? ? 'application' : 'chair'
  end

  def create
    if chair && params[:user].try(:[], :email).is_a?(String) && user_finded_by_email.try(:permissions).try(:empty?)
      user_finded_by_email.update_column :chair_id, chair.id
      user_finded_by_email.attributes = params[:user].except(:first_name, :last_name, :middle_name)
      user_finded_by_email.save
      redirect_to edit_manage_chair_user_path(chair, user_finded_by_email)
    else
      create!
    end
  end
  private


  def user_finded_by_email
    @user_finded_by_email ||=
      User.where(:chair_id => nil).find_by_email(params[:user].try(:[], :email))
  end
end
