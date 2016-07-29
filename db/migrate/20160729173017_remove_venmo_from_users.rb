class RemoveVenmoFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :venmo_username, :string
    remove_column :users, :venmo_email, :string 
  end
end
