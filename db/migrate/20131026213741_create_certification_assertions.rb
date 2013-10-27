class CreateCertificationAssertions < ActiveRecord::Migration
  def change
    create_table :certification_assertions do |t|
      t.integer :certification_id
      t.integer :user_id
      t.boolean :is_verified
      t.datetime :verification_date

      t.timestamps
    end
  end
end
