class CreateAdminAreas < ActiveRecord::Migration
  def change
    create_table :admin_areas do |t|
      t.integer :city_id
      t.string :title
      t.string :translit
    end
  end
end
