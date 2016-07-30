class AddBuyPriceToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :buy_price, :decimal
  end
end
