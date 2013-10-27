class CreateSkillAssertions < ActiveRecord::Migration
  def change
    create_table :skill_assertions do |t|
      t.integer :skill_id
      t.integer :user_id

      t.timestamps
    end
  end
end
