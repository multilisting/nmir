class FixAdvertismentDecimals < ActiveRecord::Migration
  def up 

    change_column :advertisments, :outdoors_space_from, :decimal, precision: 15, scale: 2
    change_column :advertisments, :outdoors_space_to, :decimal, precision: 15, scale: 2
    change_column :advertisments, :outdoors_space_unit, :decimal, precision: 15, scale: 2
    change_column :advertisments, :price_from, :decimal, precision: 15, scale: 2
    change_column :advertisments, :price_to, :decimal, precision: 15, scale: 2
    change_column :advertisments, :unit_price_from, :decimal, precision: 15, scale: 2
    change_column :advertisments, :unit_price_to, :decimal, precision: 15, scale: 2
    change_column :advertisments, :outdoors_unit_price_from, :decimal, precision: 15, scale: 2
    change_column :advertisments, :outdoors_unit_price_to, :decimal, precision: 15, scale: 2
    change_column :advertisments, :space_from, :decimal, precision: 15, scale: 2
    change_column :advertisments, :space_to, :decimal, precision: 15, scale: 2

  end

  def down

  end
end
