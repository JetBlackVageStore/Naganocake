class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :charge
      t.integer :payment
      t.string :addressee
      t.string :address
      t.string :postal_code
      t.string :payjp_id
      t.integer :order_status

      t.timestamps
    end
  end
end