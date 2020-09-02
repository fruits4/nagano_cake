class Admins::ApplicationController < ApplicationController

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    admin_top_path
  end

  def after_sign_out_path_for(reaource)
    new_admin_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  end


end
