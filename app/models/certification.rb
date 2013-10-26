class Certification < ActiveRecord::Base
  attr_accessible :description, :fee, :name, :path_id, :prerequisite_id, :time_in_minutes
  has_many :certification_assertions
  has_many :pending_holders, through: :certification_assertions, conditions: {is_verified: false}
  has_many :verified_holders, through: :certification_assertions, conditions: {is_verified: true}
  belongs_to :path
  belongs_to :prerequisite, :class_name => "Certification"
end
