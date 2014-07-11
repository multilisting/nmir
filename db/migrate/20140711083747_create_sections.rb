class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :advertisments_count
      t.string :url
      t.text :description
      t.text :keywords
      t.text :p
      t.string :title
      t.string :h1
      t.string :h2
      t.string :h3

      t.integer :location_id
      t.integer :offer_type
      t.integer :category
    end
  end
end
