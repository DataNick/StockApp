require 'open-uri'
require 'json'
class StockFetcher
  attr_reader :stock

  # BASE_URL = 'https://query.yahooapis.com/v1/public/yql?q='
  # QUERY = URI.encode("select * from yahoo.finance.quotes where symbol in (#{@stock})")
  # FORMAT = "&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="

  def initialize(stock)
    @stock = stock
  end

  def fetch
    ticker = @stock.inspect.upcase
    url = 'https://query.yahooapis.com/v1/public/yql?q='
    url += URI.encode("select * from yahoo.finance.quotes where symbol in (#{ticker})")
    url += "&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    data = open(url, {:read_timeout => 3}).read
    stock_hash = JSON.parse(data)
  end
end

stock = StockFetcher.new('yhoo')
p stock.fetch['query']['results']['quote']['LastTradePriceOnly'].to_f