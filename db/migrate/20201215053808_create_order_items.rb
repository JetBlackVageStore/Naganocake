class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.integer :prod_status, default: 0
      t.integer :price_with

      t.timestamps
    end
  end
end
