class RemoveValueColumnFromChores < ActiveRecord::Migration[5.0]
  def change
    remove_column :chores, :value, :integer 
  end
end
