class AddPortfolioIdToStock < ActiveRecord::Migration
  def change
    add_reference :stocks, :portfolio, index: true, foreign_key: true
  end
end
