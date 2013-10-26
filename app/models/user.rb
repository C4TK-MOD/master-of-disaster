# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  has_local_login :boolean
#  last_logged_in  :string(255)
#  zip_code        :integer
#  level           :decimal(8, 2)
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name,     :last_logged_in, :zip_code, :level, :password, :password_confirmation

  has_many :authorizations
  validates :email, :first_name, :last_name, :presence => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :uniqueness => true



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
