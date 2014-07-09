class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :title
      t.string :translit

      t.integer :location_type
      
      t.references :location
    end

    add_index :locations, :location_type
    add_index :locations, :location_id
  end
end
