class ScootersController < ApplicationController
  def show
  end

  def index
    @scooters = Scooter.all
  end
end
