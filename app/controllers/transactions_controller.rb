class TransactionsController < ApplicationController
  before_action :load_portfolio

  def new
    @transaction = Transaction.new
  end

  def index
    @transactions = Transaction.all
  end

  def create
    @transaction = @portfolio.transactions.build(transaction_params)
    if params[:transaction][:buy_sell] == 'buy'
      buy
    elsif params[:transaction][:buy_sell] == 'sell'
      sell
    end
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @portfolio, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
        format.js
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction = @portfolio.transaction.find(params[:id])
    @transaction.destroy
  end

  def show
  end

  private
  def transaction_params
    params.require(:transaction).permit(:num_of_shares, :buy_price, :buy_date, :sell_price, :sell_date, :buy_sell, :portfolio_id, :stock_id)
  end

  def load_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def buy
    stock = Stock.find(@transaction.stock_id)
    @transaction.buy_price = stock.last_price
    @transaction.buy_date = DateTime.now
  end

  def sell
    stock = Stock.find(params[:transaction][:stock_id])
    @transaction.find
  end

end
