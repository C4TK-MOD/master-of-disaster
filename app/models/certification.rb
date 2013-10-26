class Certification < ActiveRecord::Base
  attr_accessible :description, :fee, :name, :path_id, :prerequisite_id, :time_in_minutes
end
