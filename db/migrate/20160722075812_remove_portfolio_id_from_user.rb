class RemovePortfolioIdFromUser < ActiveRecord::Migration
  def change
    remove_reference :users, :portfolio, index: true, foreign_key: true
  end
end
