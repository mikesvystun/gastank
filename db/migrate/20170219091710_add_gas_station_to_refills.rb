class AddGasStationToRefills < ActiveRecord::Migration[5.0]
  def change
    add_column(:refills, :gas_station, :string)
  end
end
