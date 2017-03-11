class CreateGasstations < ActiveRecord::Migration[5.0]
  def change
    create_table :gasstations do |t|
      t.string :gas_station
    end
  end
end
