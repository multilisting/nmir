class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.integer :location_id
      t.integer :neighbor_id
    end

    add_index :neighborhoods, [:location_id, :neighbor_id], name: 'by_location_neighbor'
  end
end
