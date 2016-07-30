class ChangeAmountTypeInPortfolio < ActiveRecord::Migration
  def change
    change_column :portfolios, :amount, :decimal
  end
end
