require_relative '../../lib/stock_fetcher.rb'
require 'open-uri'
require 'json'
class Transaction < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :stock

  # def buy(ticker, quantity)
  #   ticker.upcase!
  # end
  def get_price(sym)
    sym = sym.inspect.upcase
    url = 'https://query.yahooapis.com/v1/public/yql?q='
    url += URI.encode("select * from yahoo.finance.quotes where symbol in (#{sym})")
    url += "&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    data = open(url, {:read_timeout => 5}).read
    stock_hash = JSON.parse(data)
  end

end
