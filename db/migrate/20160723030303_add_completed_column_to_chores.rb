class AddCompletedColumnToChores < ActiveRecord::Migration[5.0]
  def change
    add_column :chores, :completed, :boolean, default: false
  end
end
