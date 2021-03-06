class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def signed_in?
    !!current_user
  end

  def login!(user)
    @current_user = user
    session[:token] = user.reset_token!
  end

  def logout!
    current_user.try(:reset_token!)
    session[:token] = nil
  end

  def redirect_if_not_logged_in
    redirect_to new_session_url unless signed_in?
  end
end
