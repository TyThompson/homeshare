class SetSenderAndRecipientAsForeignKeys < ActiveRecord::Migration[5.0]
  def change
    change_column :payments, :sender_id, :integer, foreign_key: true
    change_column :payments, :recipient_id, :integer, foreign_key: true
  end
end
