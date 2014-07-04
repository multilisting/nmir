class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.string :original
      t.integer :user_id
    end

    add_index :phones, :user_id
  end
end
