require_relative '../../lib/stock_fetcher.rb'

class Stock < ActiveRecord::Base
  has_many :transactions
  # has_many :portfolios, through: :transactions

  COMPANIES = [
    "TSLA",
    "TWTR",
    "AAPL",
    "FB",
    "GOOGL",
    "ATVI",
    "AMZN",
    "LNKD",
    "MFST"
  ]
end
