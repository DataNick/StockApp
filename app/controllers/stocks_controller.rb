class StocksController < ApplicationController
  before_action :set_stock, only: [:create, :update, :destroy, :show]

  def create
  end

  def update
  end

  def show
  end

  private

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:symbol, :name, :stock_exchange, :last_price)
  end
end
