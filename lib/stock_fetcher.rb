require 'open-uri'
require 'json'
class StockFetcher
  attr_reader :stock

  def initialize(symbols)
    @symbols = symbols
  end

  def fetch
    send_to_yahoo_api
  end

  def send_to_yahoo_api
    yahoo_tickers = format_ticker
    return nil unless yahoo_tickers.length > 0
    request_api(yahoo_tickers)
  end

  def format_ticker
    valid_stocks = @symbols.select { |ticker| ticker if ticker.length > 0 }
    valid_stocks.map{ |ticker| "'" + ticker + "'" }.join(', ')
  end

  def request_api(tickers)
    url = 'https://query.yahooapis.com/v1/public/yql?q='
    url += URI.encode("select * from yahoo.finance.quotes where symbol in (#{tickers})")
    url += "&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    data = open(url, {:read_timeout => 7}).read
    parse_data(data) # returns an array of hashes
  end

  def parse_data(stock_hash)
    response_data = format_json(stock_hash)
    stock_array = []
    response_data.each do |stock|
      hash = create_hash(stock)
      stock_array << hash unless hash.nil?
    end
    stock_array
  end

  def format_json(data)
    response_data = JSON.parse(data)
    response_data['query']['results']['quote']
  end

  def create_hash(stock_hash)
    if stock_hash['Name'].nil?
      nil
    else
      {
        symbol: stock_hash['symbol'],
        name: stock_hash['Name'],
        stock_exchange: stock_hash['StockExchange'],
        last_price: stock_hash['LastTradePriceOnly']
      }
    end
  end
end

# need to parse the hash from api to just the name, ticker, date, last_price and stock exchange


# stock = StockFetcher.new(['googl', 'f', 'tsla', 'dis', 'twtr'])
# puts stock.fetch

