class AddLocationToScooters < ActiveRecord::Migration[7.1]
  def change
    add_column :scooters, :location, :string
  end
end
