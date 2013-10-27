class AdminController < ApplicationController
  def index
    redirect_to events_path unless admin?
  end
end
