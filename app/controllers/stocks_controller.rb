class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def create
    @stock = Stock.new(stock_params)
    respond_to do |format|
      if @stock.save
        mass_update
        redirect_to stocks_url, notice: "Stock was created."
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @stock = Stock.new
    @stocks = Stock.search(params[:search])
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
    Stock.update_all_stocks(stock_data)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end


  def stock_params
    params.require(:stock).permit(:symbol)
  end
end