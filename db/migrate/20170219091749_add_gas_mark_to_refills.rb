class AddGasMarkToRefills < ActiveRecord::Migration[5.0]
  def change
    add_column(:refills, :gas_mark, :string)
  end
end
