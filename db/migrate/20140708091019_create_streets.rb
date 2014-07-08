class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.integer :location_id
      t.integer :location_type
      t.string :title
      t.string :translit
    end
  end
end
