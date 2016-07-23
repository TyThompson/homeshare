class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.integer  "user_id"
      t.integer  "home_id",      null: false
      t.string   "name",         null: false
      t.float    "amount",       null: false
      t.datetime "due"
      t.datetime "created_at",   null: false
      t.datetime "completed_at"
    end
  end
end
