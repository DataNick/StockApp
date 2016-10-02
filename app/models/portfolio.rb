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

  def total_weighted_average
    total = 0.0
    transactions.each{ |trade| total += trade.weighted_average }
    total
  end

end
