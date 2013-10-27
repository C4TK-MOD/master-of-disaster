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
#  last_logged_in  :string(255)
#  zip_code        :integer
#  level           :decimal(8, 2)
#

class User < ActiveRecord::Base

  attr_accessible :email, :first_name, :last_name, :last_logged_in, :zip_code, :level,
    :password, :password_confirmation, :finish_setup, :phone, :is_local, :skill_ids,
    :physical_asset_ids, :certification_ids
  attr_accessor :finish_setup, :is_local, :skill_ids, :physical_asset_ids,
    :password, :password_confirmation

  has_many :authorizations
  validates :email, :first_name, :last_name, :presence => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :uniqueness => true
  validates :zip_code, :phone, :presence => true, :unless => :finish_setup?
  validate :password, :unless => :finish_setup? || :is_remote_login?
  validates_confirmation_of :password, :unless => :finish_setup? || :is_remote_login?


  has_many :skill_assertions
  has_many :skills, through: :skill_assertions

  has_many :certification_assertions
  has_many :certifications, through: :certification_assertions

  has_many :owned_assets
  has_many :physical_assets, through: :owned_assets

  accepts_nested_attributes_for :skill_assertions, :allow_destroy => true,
     :reject_if => proc { |attrs| attrs['_id'].blank? && attrs['_destroy'] == "1"}

  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless user = authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
    return user
  end

  def full_name
    return first_name + " " + last_name
  end

  def text_notification_number
    # TODO: Add a check for text notification opt-in. For now, just send.
    stripped_phone_number = phone.gsub(/[ \-\(\)]*/, '')
    if stripped_phone_number.length == 9
      stripped_phone_number = "1#{stripped_phone_number}"
    end
    stripped_phone_number
  end

  def self.signed_in?
    return session && session.has_key?(:user_id)
  end

  def finish_setup?
    return @finish_setup
  end

  def is_remote_login?
    return self.authorizations.count != 0 && self.authorizations.find_by_provider("facebook")
  end
end
