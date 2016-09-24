class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :stocks, through: :transactions

  validates :name,  uniqueness: true, length: { minimum: 5 }

  # def total_value
  #   stocks_value = self.stocks.inject {|sum, stock| sum + stock.last_price}
  #   amount + stock_value
  # end

  def portfolio_value
    # self.transactions.collect {|ti| ti.num_of_shares * ti.buy_price }.sum
    transactions.map{|trans| trans.stock.last_price * trans.num_of_shares }.inject(:+)
  end
end
