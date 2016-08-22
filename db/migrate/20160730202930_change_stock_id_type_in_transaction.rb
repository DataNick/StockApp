class ChangeStockIdTypeInTransaction < ActiveRecord::Migration
  def change
    change_column :transactions, :stock_id, :integer
  end
end
