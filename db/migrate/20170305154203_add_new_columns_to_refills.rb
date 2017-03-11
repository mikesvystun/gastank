class AddNewColumnsToRefills < ActiveRecord::Migration[5.0]
  def change
    add_column(:refills, :gasstation_id, :integer)
    add_column(:refills, :gasmark_id, :integer)
  end
end
