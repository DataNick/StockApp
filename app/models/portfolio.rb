class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :stocks, through: :transactions
end
