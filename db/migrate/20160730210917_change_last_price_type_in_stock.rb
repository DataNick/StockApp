class ChangeLastPriceTypeInStock < ActiveRecord::Migration
  def change
    change_column :stocks, :last_price, :decimal
  end
end
