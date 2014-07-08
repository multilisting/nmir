class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :district_id
      t.integer :region_id
      t.string :title
      t.string :translit
    end
  end
end
