class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :admin])
  end

  def authenticate_admin!
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end
end
