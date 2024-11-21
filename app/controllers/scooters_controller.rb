class ScootersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @scooters = Scooter.left_joins(:bookings).where(booking_id = nil)
  end

  def show
    @scooter = Scooter.find(params[:id])
    @booking = Booking.new
    @total_price = @booking.total_price
  end

  def edit
    @scooter = Scooter.find(params[:id])
  end

  def update
    @scooter = Scooter.find(params[:id])
    @scooter.update(scooter_params)
    redirect_to scooters_my_scooters_path, notice: "Scooter edited successfully."
  end

  def new
    @scooter = Scooter.new
  end

  def create
    @scooter = Scooter.new(scooter_params)
    @scooter.user = current_user

    if @scooter.save
      redirect_to scooters_my_scooters_path, notice: 'Scooter added successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_scooters
    @scooters = current_user.scooters
  end

  private

  def scooter_params
    params.require(:scooter).permit(:model, :description, :price_per_day, images: [])
  end
end
