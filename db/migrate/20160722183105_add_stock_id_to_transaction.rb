class AddStockIdToTransaction < ActiveRecord::Migration
  def change
    add_reference :transactions, :stock, index: true, foreign_key: true
  end
end
