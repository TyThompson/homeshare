class AddChoreXpToChores < ActiveRecord::Migration[5.0]
  def change
    add_column :chores, :chore_xp, :integer
  end
end
