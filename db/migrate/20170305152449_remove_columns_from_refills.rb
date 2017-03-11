class RemoveColumnsFromRefills < ActiveRecord::Migration[5.0]
  def change
    remove_column(:refills, :gas_mark, :string)
    remove_column(:refills, :gas_station, :string)
  end
end
