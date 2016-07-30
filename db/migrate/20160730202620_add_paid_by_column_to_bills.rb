class AddPaidByColumnToBills < ActiveRecord::Migration[5.0]
  def change
    add_column :bills, :paid_by, :integer
    add_column :bills, :paid_at, :datetime 
  end
end
