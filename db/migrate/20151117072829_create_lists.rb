class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :price
      t.string :description
      t.integer :bathroom
      t.integer :bedroom
      t.integer :bed
      t.string :property_type
      t.string :room_type
      t.integer :user_id
      t.json :images

      t.timestamps null: false
    end
  end
end
