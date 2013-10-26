class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_logged_in, :string
    add_column :users, :zip_code, :int
    add_column :users, :level, :decimal, :precision => 8, :scale => 2
  end
end
