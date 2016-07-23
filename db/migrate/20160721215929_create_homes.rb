class CreateHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :homes do |t|
      t.integer  "creator_id", null: false
      t.string   "name",       null: false
      t.float    "rent"
      t.string   "city"
      t.datetime "created_at", null: false
    end
  end
end
