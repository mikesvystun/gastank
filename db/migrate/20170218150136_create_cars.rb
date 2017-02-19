class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :total_probig
      t.decimal :total_vartist, precision: 9, scale: 2
      t.decimal :total_liters, precision: 9, scale: 2
      t.decimal :avg_rozhid, precision: 9, scale: 2
      t.integer :user_id


      t.timestamps
    end
  end
end
