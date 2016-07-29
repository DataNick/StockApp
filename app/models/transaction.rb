class Transaction < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :stock

  def add_to_portfolio
  end
end
