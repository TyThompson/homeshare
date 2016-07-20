class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :homes, :user_id, :creator_id 
  end
end
