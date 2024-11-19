class AddPriceToScooters < ActiveRecord::Migration[7.1]
  def change
    add_column :scooters, :price, :integer
  end
end
