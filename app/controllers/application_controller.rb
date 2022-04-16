
class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  before_action :authorize_request
  
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
