class RemoveCompletedAtColumnFromBills < ActiveRecord::Migration[5.0]
  def change
    remove_column :bills, :completed_at, :datetime 
  end
end
