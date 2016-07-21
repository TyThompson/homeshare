class AddCompleterIdAndCreatorIdAndAvatarColumnToChores < ActiveRecord::Migration[5.0]
  def change
    rename_column :chores, :user_id, :chore_creator_id
    add_column :chores, :chore_completer_id, :integer
    add_column :chores, :chore_assignee_id, :integer
    add_column :chores, :avatar, :string
  end
end
