class CreateNonAdminAreas < ActiveRecord::Migration
  def change
    create_table :non_admin_areas do |t|
      t.integer :city_id
      t.integer :admin_area_id
      t.string :title
      t.string :translit
    end
  end
end
