class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout :layout_by_resource

  def layout_by_resource
    if (devise_controller? && resource_name == :user && action_name == 'new') ||
       (devise_controller? && resource_name == :user && action_name == 'create')
      'login'
    else
      'application'
    end
  end

  protected

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end
end
