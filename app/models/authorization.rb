# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  token      :string(255)
#

class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :user, :token

  belongs_to :user
  validates :provider, :uid, :presence => true

  def self.find_or_create(auth_hash)
    if auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      auth.update_attributes(:token => auth_hash["credentials"]["token"])
    end
    unless User.find_by_email(auth_hash["info"]["email"])
      user = User.create :first_name => auth_hash["info"]["first_name"], 
        :last_name => auth_hash["info"]["last_name"],
        :email => auth_hash["info"]["email"],
        :finish_setup => true
      auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"], :token => auth_hash["credentials"]["token"]
    end
   
    auth
  end
end
