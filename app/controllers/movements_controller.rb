class MovementsController < ApplicationController
  before_action :set_transaction

  def index
    @movements = @transaction.movements.find.all
  end

  def create
    @movement = Movement.new(movement_params)

  end

  def destroy
  end

  def update
  end

  private

    def set_transaction
      @transaction = Transaction.find(params[:portfolio][:transaction_id])
    end

    def movement_params
      params.require(:movement).permit(:price, :date, :transaction_id, :action)
    end
end