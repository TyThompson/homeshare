class AddPurchasedToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :purchased, :boolean, default: false
    add_column :items, :purchased_at, :datetime 
  end
end
