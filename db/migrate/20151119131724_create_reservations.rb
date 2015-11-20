class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :list, index: true, foreign_key: true
      t.string :check_in_date
      t.string :check_out_date
      t.integer :price
      t.integer :total

      t.timestamps null: false
    end
  end
end
