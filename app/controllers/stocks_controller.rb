# require_relative '../../lib/stock_fetcher.rb'

class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def create
    @stock = Stock.new(stock_params)

    if @stock.save
      redirect_to @stock, notice: "Stock was created."
    else
      redirect_to @stock, alert: "Something went wrong."
    end
  end

  def index
    @stocks = Stock.all
  end

  def update
  end

  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
  end

  def new
    @stock = Stock.new
  end

  def mass_update
    update_quotes
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'All stocks were updated.'}
      format.json { head :no_content }
    end
  end

  private

  def update_quotes(tickers = Stock.all.pluck(:symbol))
    fetcher = StockFetcher.new(tickers)
    stock_data = fetcher.fetch
    Stock.transaction do
      stock_data.each do |stock_hash|
        stock = Stock.find_by(symbol: stock_hash[:symbol])
        stock.update!(stock_hash)
      end
    end
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end


  def stock_params
    params.require(:stock).permit(:symbol)
  end
end