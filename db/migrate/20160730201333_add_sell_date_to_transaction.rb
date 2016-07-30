class AddSellDateToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :sell_date, :datetime
  end
end
