class CreateOwnedAssets < ActiveRecord::Migration
  def change
    create_table :owned_assets do |t|
      t.integer :physical_asset_id
      t.integer :user_id
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
