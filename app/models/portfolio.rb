class Portfolio < ActiveRecord::Base
  has_many :stocks, through: :transactions
  has_many :transactions
  belongs_to :user
end
