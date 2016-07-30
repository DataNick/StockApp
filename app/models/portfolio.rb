class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :stocks, through: :transactions

  # accepts_nested_attributes_for :transactions
  # accepts_nested_attributes_for :stocks

  # Managing a person's portfolio through transactions

end
