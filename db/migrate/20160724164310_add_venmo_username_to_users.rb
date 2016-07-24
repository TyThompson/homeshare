class AddVenmoUsernameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :venmo_username, :string
    add_column :users, :venmo_email, :string 
  end
end
