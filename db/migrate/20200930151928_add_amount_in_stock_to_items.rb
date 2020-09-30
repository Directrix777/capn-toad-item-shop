class AddAmountInStockToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :amount_in_stock, :integer
  end
end
