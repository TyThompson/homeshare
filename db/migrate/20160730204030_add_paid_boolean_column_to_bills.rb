class AddPaidBooleanColumnToBills < ActiveRecord::Migration[5.0]
  def change
    add_column :bills, :paid, :boolean, default: false
  end
end
