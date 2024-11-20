class ScootersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @scooters = Scooter.all
  end

  def show
    @scooter = Scooter.find(params[:id])
    @booking = Booking.new
  end

  def new
    @scooter = Scooter.new
  end

  def create
    @scooter = Scooter.new(scooter_params)

    if @scooter.save
      redirect_to scooters_path, notice: 'Scooter added successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def scooter_params
    params.require(:scooter).permit(:description, :price_per_day, images: [])
  end
end
