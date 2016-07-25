class RemoveItemColumnFromLists < ActiveRecord::Migration[5.0]
  def change
    remove_column :lists, :item, :string
  end
end
