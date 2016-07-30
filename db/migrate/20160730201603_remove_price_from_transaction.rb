class RemovePriceFromTransaction < ActiveRecord::Migration
  def change
    remove_column :transactions, :price, :float
  end
end
