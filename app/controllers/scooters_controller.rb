class ScootersController < ApplicationController
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
    params.require(:scooter).permit(:description, :price, :image)
  end

end