class ScootersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @scooters = Scooter.all
  end

  def show
    @scooter = Scooter.find(params[:id])
    @booking = Booking.new
  end

  def edit
    @scooter = Scooter.find(params[:id])
  end

  def update
  @scooter = Scooter.find(params[:id])

  if params[:scooter][:images_to_remove].present?
    params[:scooter][:images_to_remove].each do |image_id|
      image = @scooter.images.find(image_id)
      image.purge if image
    end
  end

  @scooter.images.attach(params[:scooter][:images]) if params[:scooter][:images].present?

  if @scooter.update(scooter_params)
    redirect_to scooters_my_scooters_path, notice: "Scooter successfully updated."
  else
    flash[:alert] = "Failed to update scooter."
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

  def destroy
    @scooter = Scooter.find(params[:id])
    @scooter.destroy

    redirect_to scooters_my_scooters_path, notice: "Scooter deleted successfully"
  end

  private

  def scooter_params
    params.require(:scooter).permit(:model, :description, :price_per_day, images: [])
  end
end
