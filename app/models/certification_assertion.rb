class CertificationAssertion < ActiveRecord::Base
  attr_accessible :certification_id, :is_verified, :user_id, :verification_date
  belongs_to :user
  belongs_to :certification

  def display_label
    "#{certification.name}#{' <strong>[VERIFIED]</strong>' if is_verified?}"
  end
end
