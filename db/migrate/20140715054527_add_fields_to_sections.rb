class AddFieldsToSections < ActiveRecord::Migration
  def change
    add_column :sections, :property_type, :integer
  end
end
