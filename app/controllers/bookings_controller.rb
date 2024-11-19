class BookingsController < ApplicationController

  def create
  @booking = Booking.new(booking_params)
  @scooter = Scooter.find(params[:scooter_id])
  @booking.scooter = @scooter
  @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "booking/new", status: :unprocessable_entity
    end
  end
end
