class CreatePhysicalAssets < ActiveRecord::Migration
  def change
    create_table :physical_assets do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
