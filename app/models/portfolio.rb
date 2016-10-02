class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :stocks, through: :transactions

  validates :name,  uniqueness: true, length: { minimum: 5 }


  def portfolio_value
    transactions.map{|trans| trans.stock.last_price * trans.num_of_shares }.inject(:+)
  end

  # def initial_cost
  #   transactions.collect{|trade| trade.buy_price ? trade.buy_price.to_f * trade.num_of_shares : 0 }.sum
  # end

  def gain_loss
    transaction.collect{|trade| (trade.sell_price - trade.buy_price) / trade.buy_price }
    #-- or -- (tranasaction.sell_price - transaction.buy_price) / transaction.buy_price
  end

  def total_investment
    total = 0.0
    transactions.each{ |trade| total += trade.investment }
    total
  end

  def weighted_average
    total = 0.0
    transactions.each{ |trade| total += trade.weighted_average }
    total
  end

  #Average gain/loss
  #annualized returns?
  #Investment = number of shares * buy price
  #@portfolio.transactions.average(:gain/loss) => average
  #want to get weighted average - different portion of investment in some versus others
    #(first gain * (investment / total investment)) + (second gain *(investment / total investment)) + (third gain * (investment / total investment))

#     Portfolio weight - % composition of a particular holding in a portfolio.
# Different approaches to calculating weight.
# 1. Divide the dollar value of a security by the total dollar value of the portfolio
# 2. Divide the number of units of a given security by the total number of shares held in the portfolio
# 3. Market value of stock position = multiply the share price by the number of shares outstanding

end
