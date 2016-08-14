class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :stocks, through: :transactions

  def total_value
    stocks_value = self.stocks.inject {|sum, stock| sum + stock.last_price}
    amount + stock_value
  end
end
