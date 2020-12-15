class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :specifcation
      t.integer :price_without
      t.string :image_id
      t.boolean :item_status

      t.timestamps
    end
  end
end
