class RemovePortfolioIdFromStock < ActiveRecord::Migration
  def change
    remove_reference :stocks, :portfolio, index: true, foreign_key: true
  end
end
