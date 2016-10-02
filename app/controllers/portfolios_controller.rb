class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :update, :destroy]

  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.includes(:transactions, :stocks).find(params[:id])
    @transaction = Transaction.new
  end

  def new
    @portfolio = Portfolio.new
    1.times {@portfolio.stocks.build}
  end

  def edit
  end

  def create
    @portfolio = Portfolio.new(portfolio_params.merge! user_id: current_user.id)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_amount
    @portfolio = Portfolio.includes(:transactions, :stocks).find(params[:portfolio_id])
    respond_to do |format|
      if @portfolio.update_attribute(:amount, @portfolio.transactions.map{|trans| trans.stock.last_price * trans.num_of_shares }.inject(:+))
        format.html { redirect_to @portfolio, notice: 'Portfolio amount was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:name, :amount)
    end
end
