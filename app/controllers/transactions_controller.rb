class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @transaction = Transaction.new
    @car = Car.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      if @transaction.valid?
        @car = Car.find_or_create_by(license_number: params["transaction"]["car"]["license_number"], car_type: params["transaction"]["car"]["car_type"])
        @transaction.car_id = @car.id if @car.id
        @transaction.save if @car.id
      end

      format.js
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:mud_in_bed, :bed_down)
  end
end
