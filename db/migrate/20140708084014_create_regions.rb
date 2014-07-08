class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :title
      t.string :translit
    end
  end
end
