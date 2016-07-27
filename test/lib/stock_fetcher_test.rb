require "test_helper"
require "stock_fetcher"

class StockFetcherTest < MiniTest::Test

  def test_it_fetches_stock_info
    stock = StockFetcher.new('GOOG')
    stock.fetch

    assert_equal "GOOG", stock.fetch['query']['results']['quote']['symbol']
  end

  def test_it_fetches_price
    stock = StockFetcher.new('GOOG')
    stock.fetch
    stock.fetch['query']['results']['quote']['LastTradePriceOnly']
    assert true
  end
end