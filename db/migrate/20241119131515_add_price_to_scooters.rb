class AddPriceToScooters < ActiveRecord::Migration[7.1]
  def change
    add_column :scooters, :price_per_day, :float
  end
end
