class ChangeSectionsDefaults < ActiveRecord::Migration
  def up
    change_column_default :sections, :advertisments_count, 0
  end

  def down 
    change_column_default :sections, :advertisments_count, nil
  end
end
