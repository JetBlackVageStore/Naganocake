class AddUserStatusToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :user_status, :boolean, default: true, null: false
  end
end
