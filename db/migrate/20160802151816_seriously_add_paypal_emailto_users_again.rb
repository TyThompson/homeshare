class SeriouslyAddPaypalEmailtoUsersAgain < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :paypal_email, :string
  end
end
