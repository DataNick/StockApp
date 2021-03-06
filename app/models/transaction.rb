class Transaction < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :stock
  has_many :movements, :dependent => :destroy
  validates :stock_id, presence: true
  validates :num_of_shares, presence: true

  TYPES = ["buy", "sell"]

  # def sell(quantity)
  #   if quantity > num_of_shares
  #     notice: "The quantity exceeds number of shares owned."
  #   else
  #     self.num_of_shares =- quantity
  #   end
  # end

  def investment
    if buy_price
      num_of_shares * buy_price
    end
  end

  def gain_loss
    ( ( ( sell_price - buy_price ) / buy_price ) * 100 ).round(2)
  end

  def weighted_average
     (gain_loss * (investment / @portfolio.total_investment))
  end

end
