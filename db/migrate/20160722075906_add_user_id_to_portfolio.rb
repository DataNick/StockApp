class AddUserIdToPortfolio < ActiveRecord::Migration
  def change
    add_reference :portfolios, :user, index: true, foreign_key: true
  end
end
