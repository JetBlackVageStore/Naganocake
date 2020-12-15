class CreateAddDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :add_deliveries do |t|
      t.integer :customer_id
      t.string :addressee
      t.string :address
      t.string :postal_code

      t.timestamps
    end
  end
end
