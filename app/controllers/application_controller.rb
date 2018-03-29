class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :require_login

  def require_login
    redirect_to new_user_session_path if !current_user
  end

  private

  # Overwriting the users/sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
