class AddModelColumnToScooters < ActiveRecord::Migration[7.1]
  def change
    add_column :scooters, :model, :string
  end
end
