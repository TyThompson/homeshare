class CreateUserHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_homes do |t|
      t.integer  "user_id",                    null: false
      t.integer  "home_id",                    null: false
      t.integer  "exp",        default: 0,     null: false
      t.boolean  "admin",      default: false, null: false
      t.datetime "created_at",                 null: false
      t.integer  "user_level"
    end
  end
end
