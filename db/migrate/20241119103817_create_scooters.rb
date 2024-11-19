class CreateScooters < ActiveRecord::Migration[7.1]
  def change
    create_table :scooters do |t|
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
