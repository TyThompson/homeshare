class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :item_xp
      t.integer :list_id
      t.integer :item_creator
      t.integer :purchaser_id
      t.integer :list_id
      t.integer :home_id

      t.timestamps
    end
  end
end
