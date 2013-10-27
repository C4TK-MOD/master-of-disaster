class EventParticipation < ActiveRecord::Base
  attr_accessible :event_id, :is_verified, :time_in_minutes, :user_id
end
