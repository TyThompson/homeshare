class AssignBillCreatorAvatarToBill < ActiveRecord::Migration[5.0]
  def change
    add_column :bills, :user_avatar, :string 
  end
end
