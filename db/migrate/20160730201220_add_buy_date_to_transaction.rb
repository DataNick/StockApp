class AddBuyDateToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :buy_date, :datetime
  end
end
