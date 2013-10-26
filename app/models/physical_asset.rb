class PhysicalAsset < ActiveRecord::Base
  attr_accessible :name, :category_id
  belongs_to :category
end
