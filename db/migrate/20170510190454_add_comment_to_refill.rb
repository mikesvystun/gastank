class AddCommentToRefill < ActiveRecord::Migration[5.0]
  def change
    add_column :refills, :comment, :text 
  end
end
