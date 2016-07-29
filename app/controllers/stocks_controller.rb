class StocksController < ApplicationController
  # before_action :set_stock, only: [:create, :update, :destroy, :show]

  def create
    portfolio = Portfolio.find(params[:id])
    stock = Stock.new(stock_params.merge! portfolio_id: portfolio.id)

    if stock.save
      redirect_to portfolio, notice: "Stock was added to portfolio."
    else
      redirect_to portfolio, alert: "Something went wrong."
    end
  end

  def update
  end

  def show
  end

  def new
    @stock = Stock.new
  end

  private

  # def set_stock
  #   @stock = Stock.find(params[:id])
  # end

  def stock_params
    params.require(:stock).permit(:symbol, :name, :stock_exchange, :last_price)
  end
end
