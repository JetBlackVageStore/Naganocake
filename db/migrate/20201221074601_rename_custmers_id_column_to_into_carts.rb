class RenameCustmersIdColumnToIntoCarts < ActiveRecord::Migration[5.2]
  def change
    rename_column :into_carts, :custmers_id, :customer_id
  end

end
