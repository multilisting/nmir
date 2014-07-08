class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :region_id
      t.string :title
      t.string :translit
    end
  end
end
