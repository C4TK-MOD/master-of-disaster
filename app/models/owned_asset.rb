class OwnedAsset < ActiveRecord::Base
  attr_accessible :physical_asset_id, :quantity, :user_id
end
