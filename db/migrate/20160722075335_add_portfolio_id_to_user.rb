class AddPortfolioIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :portfolio, index: true, foreign_key: true
  end
end
