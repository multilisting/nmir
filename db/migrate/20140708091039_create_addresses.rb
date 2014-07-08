class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :street_id
      t.string :title
      t.string :translit
    end
  end
end
