class ScootersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @scooters = Scooter.all
    # @scooters = Scooter.all.filter do |scooter|
    #   scooter.bookings.each do |booking|
    #     @booking_span = (booking.start_date..booking.end_date).to_a
    #   end
    #   if @booking_span.nil?
    #       true
    #   else
    #     @booking_span.exclude?(Date.current)
    #   end
    # end
  end

  def show
    @scooter = Scooter.find(params[:id])
    @booking = Booking.new
    # @price_per_day = @booking.scooter.price_per_day
  end

  def edit
    @scooter = Scooter.find(params[:id])
  end

  def update
    @scooter = Scooter.find(params[:id])

    if params[:scooter][:images_to_remove].present?
    params[:scooter][:images_to_remove].each do |image_key|
      image = @scooter.images.find_by(key: image_key)
      image.purge if image
    end
  end

  if @scooter.update(scooter_params)
    if params[:scooter][:images].present?
      @scooter.images.attach(params[:scooter][:images])
    end
    redirect_to scooters_my_scooters_path, notice: 'Scooter was successfully updated.'
  else
    render :edit
  end

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
