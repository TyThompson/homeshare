class AddPaypalInfoColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :paypal_email, :string
    add_column :users, :paypal_id, :string
    add_column :users, :paypal_token, :string 
  end
end
