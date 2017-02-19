class CreateRefills < ActiveRecord::Migration[5.0]
  def change
    create_table :refills do |t|
      t.boolean :full
      t.decimal :liters, precision: 9, scale: 2
      t.decimal :vartist, precision: 9, scale: 2
      t.integer :probig
      t.decimal :avg_rozhid, precision: 9, scale: 2
      t.decimal :km_na_l, precision: 9, scale: 2
      t.decimal :ml_na_ga, precision: 9, scale: 2
      t.decimal :avg_uah_km, precision: 9, scale: 2
      t.decimal :avg_uah_l, precision: 9, scale: 2
      t.integer :car_id

      t.timestamps
    end
  end
end
