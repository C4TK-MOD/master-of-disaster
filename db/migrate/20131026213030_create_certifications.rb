class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :name
      t.text :description
      t.integer :time_in_minutes
      t.decimal :fee
      t.integer :path_id
      t.integer :prerequisite_id

      t.timestamps
    end
  end
end
