class CreateStans < ActiveRecord::Migration[5.0]
  def change
    create_table :stans do |t|
      t.string :stan
    end
  end
end
