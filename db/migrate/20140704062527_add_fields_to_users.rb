class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :blocked, :boolean, default: false
    add_column :users, :from_admin, :boolean, default: false
    add_column :users, :role, :integer, not_null: true
  end
end
