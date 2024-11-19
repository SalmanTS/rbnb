class ScootersController < ApplicationController
  def index
    @scooters = Scooter.all
  end

  def show
    @scooter = Scooter.find(params[:id])
    @booking = Booking.new
  end

end
