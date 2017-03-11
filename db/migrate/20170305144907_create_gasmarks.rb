class CreateGasmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :gasmarks do |t|
      t.string :gas_mark
  end
end
end
