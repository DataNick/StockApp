class Transaction < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :stock
  validates :stock_id, presence: true
  validates :num_of_shares, presence: true
end
