class Event < ActiveRecord::Base
  attr_accessible :city, :description, :end_time, :name, :start_time, :state, :zip, :image_url
end
