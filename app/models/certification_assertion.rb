class CertificationAssertion < ActiveRecord::Base
  attr_accessible :certification_id, :is_verified, :user_id, :verification_date
end
