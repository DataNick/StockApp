class Transaction < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :stock
  validates :stock_id, presence: true
  validates :num_of_shares, presence: true

  TYPES = ["buy", "sell"]

  def sell(quantity)
    self.num_of_shares =- quantity
  end

  def investment
    if buy_price
      num_of_shares * buy_price
    end
  end

  def gain_loss
    ( ( ( sell_price - buy_price ) / buy_price ) * 100 ).round(2)
  end

  def weighted_average
     #(first gain * (investment / total investment)) + (second gain *(investment / total investment)) + (third gain * (investment / total investment))
     (gain_loss * (investment / @portfolio.investment))
  end

end
