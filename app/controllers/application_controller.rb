class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    redirect_to login_path unless session && session.has_key?(:user_id)
  end
end
