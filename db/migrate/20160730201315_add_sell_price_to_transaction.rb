class AddSellPriceToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :sell_price, :decimal
  end
end
