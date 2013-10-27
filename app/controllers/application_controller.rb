class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate

  def authenticate
    redirect_to login_path unless session && session.has_key?(:user_id)
  end

  def current_user
    @current_user ||= if session && session.has_key?(:user_id)
      User.find_by_id(session[:user_id])
    end
  end

  helper_method :current_user

  def admin?
    current_user && current_user.is_admin?
  end

  helper_method :admin?
end
