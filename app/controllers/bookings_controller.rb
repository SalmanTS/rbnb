class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @scooter = Scooter.find(params[:scooter_id])
    @booking.scooter = @scooter
    @booking.user = current_user
    duration = (@booking.start_date..@booking.end_date).to_a.count
    @booking.save!
    redirect_to scooters_path, notice: "Successfully booked your scooter for $#{duration * @booking.scooter.price_per_day}, your credit card will be automatically debited."
      # if @booking.save
      #   redirect_to scooters_path
      # else
      #   render scooter_path(@scooter), status: :unprocessable_entity
      # end
    # @total_price = @scooter.bookings.first.total_price
  end

  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date, :price_per_day, :total_price)
  end
end
