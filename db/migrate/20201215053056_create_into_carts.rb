class CreateIntoCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :into_carts do |t|
      t.integer :item_id
      t.integer :custmers_id
      t.integer :quantity

      t.timestamps
    end
  end
end
