class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(_resource)
    user_projects_path(current_user)
  end

  private

  def user_not_authorized(_exception)
    flash[:danger] = 'Not authorized'
    redirect_to(request.referrer || root_path)
  end
end
