class Certification < ActiveRecord::Base
  attr_accessible :description, :fee, :name, :path_id, :prerequisite_id, :time_in_minutes
  has_many :certification_assertions
  has_many :pending_holders, through: :certification_assertions, conditions: {is_verified: false}
  has_many :verified_holders, through: :certification_assertions, conditions: {is_verified: true}
  belongs_to :path
  belongs_to :prerequisite, :class_name => "Certification"

  # local user only, for now
  attr_accessible :belongs_to_user
  attr_accessor :belongs_to_user

  def full_display
    return { "name" => name,
      "description" => description,
      "id" => id,
      "path_id" => path_id,
      "time_in_minutes" => time_in_minutes,
      "prerequisite_id" => prerequisite_id,
      "belongs_to_user" => belongs_to_user || false
    }
  end
end
