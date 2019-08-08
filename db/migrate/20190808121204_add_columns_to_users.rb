class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :birthday, :date
    add_column :users, :address, :integer
    add_column :users, :sex, :integer
    add_column :users, :profile, :integer
  end
end
