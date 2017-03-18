class AddStanToRefills < ActiveRecord::Migration[5.0]
  def change
    add_column(:refills, :stan_id, :integer)
  end
end
