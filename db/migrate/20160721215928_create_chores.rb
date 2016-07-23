class CreateChores < ActiveRecord::Migration[5.0]
  def change
    create_table :chores do |t|
      t.integer  "chore_creator_id"
      t.integer  "home_id",            null: false
      t.string   "name",               null: false
      t.text     "description"
      t.float    "bill_value"
      t.integer  "votes"
      t.integer  "thumbs_up"
      t.datetime "created_at",         null: false
      t.datetime "completed_at"
      t.integer  "chore_completer_id"
      t.integer  "chore_assignee_id"
      t.string   "avatar"
      t.integer  "chore_xp"
    end
  end
end
