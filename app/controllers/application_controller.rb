class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?
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

  def after_sign_in_path_for(_resource)
    root_path
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :middle_name, :last_name, :sex, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :middle_name, :last_name, :sex, :email, :password, :current_password)
    end
  end
end
