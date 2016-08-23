class Stock < ActiveRecord::Base
  has_many :transactions
  # has_many :portfolios, through: :transactions
  # attr_accessor :stock
  validates :symbol, uniqueness: true, length: { minimum: 1 }


  def fetch_stock(symbol)
    symbol = symbol.inspect.upcase
    url = 'https://query.yahooapis.com/v1/public/yql?q='
    url += URI.encode("select * from yahoo.finance.quotes where symbol in (#{symbol})")
    url += "&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    data = open(url, {:read_timeout => 5}).read
    stock_hash = JSON.parse(data)
  end

  def self.insert_or_update(stock_hash)
  end

  private

  def update_or_create(stock, stock_hash)
    if stock
      stock.update!(stock_hash)
    else
      Stock.create!(stock_hash)
    end
  end

  def persist

  end

  # Stock.find_or_create_by(symbol: ticker)
end
