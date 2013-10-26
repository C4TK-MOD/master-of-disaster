# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_name      :string(255)
#  last_name       :string(255)
#  password_digest :string(255)      
#  has_local_login :boolean
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest

  has_many :authorizations

  has_many :skill_assertions
  has_many :skills, through: :skill_assertions

  has_many :certification_assertions
  has_many :certifications, through: :certification_assertions

  validates :email, :first_name, :last_name, :password_digest, :presence => true

  accepts_nested_attributes_for :skill_assertions

  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
  end

  def full_name
    return first_name + " " + last_name
  end

  def self.signed_in?
    return session && session.has_key?(:user_id)
  end
end
