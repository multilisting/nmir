class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :location_type
      t.integer :location_id
      t.string :title
      t.string :translit
    end
  end
end
