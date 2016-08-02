class AddJustPaypal < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :paypal, :string 
  end
end
