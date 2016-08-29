class Stock < ActiveRecord::Base
  has_many :transactions
  # has_many :portfolios, through: :transactions
  # attr_accessor :stock
  validates :symbol, uniqueness: true, length: { minimum: 1 }
  before_save { self.symbol = symbol.upcase }

  def self.search(search)
    if search
      self.where("symbol LIKE ?", "#{search}")
    else
      self.all
    end
  end

  def fetch_stock(symbol)
    symbol = symbol.inspect.upcase
    url = 'https://query.yahooapis.com/v1/public/yql?q='
    url += URI.encode("select * from yahoo.finance.quotes where symbol in (#{symbol})")
    url += "&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    data = open(url, {:read_timeout => 5}).read
    stock_hash = JSON.parse(data)
  end

  def self.update_all_stocks(stock_data)
    stock_data.each do |stock_hash|
      stock = Stock.find_by(symbol: stock_hash[:symbol])
      stock.update!(stock_hash)
    end
  end

end
