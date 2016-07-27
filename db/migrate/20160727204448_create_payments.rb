class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :title
      t.string :description
      t.float :amount
      t.integer :sender_id
      t.string :sender_paypal_email
      t.integer :recipient_id
      t.string :recipient_paypal_email
      t.datetime :paid_at
      t.timestamps
    end
  end
end
