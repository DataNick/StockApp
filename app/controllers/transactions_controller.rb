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
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @portfolio, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
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

  def show
  end

  private
  def transaction_params
    params.require(:transaction).permit(:num_of_shares, :buy_price, :buy_date, :sell_price, :sell_date, :portfolio_id, :stock_id)
  end

  def load_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end
end
