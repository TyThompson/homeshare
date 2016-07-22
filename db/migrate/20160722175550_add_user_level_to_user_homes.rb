class AddUserLevelToUserHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :user_homes, :user_level, :integer 
  end
end
