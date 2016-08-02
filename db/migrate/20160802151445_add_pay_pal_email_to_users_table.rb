class AddPayPalEmailToUsersTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :paypal_email, :string 
  end
end
