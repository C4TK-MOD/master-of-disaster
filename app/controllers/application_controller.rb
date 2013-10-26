class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate

  def authenticate
    redirect_to login_path unless session && session.has_key?(:user_id)
  end
end
