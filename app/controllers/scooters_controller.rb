class ScootersController < ApplicationController
  def index
    @scooters = Scooter.all
  end
end
