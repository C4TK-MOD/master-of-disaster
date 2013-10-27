class OwnedAsset < ActiveRecord::Base
  attr_accessible :quantity

  belongs_to :physical_asset
  belongs_to :user

  def display_label
    "#{physical_asset.name} (#{quantity})"
  end

end
