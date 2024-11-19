class Scooter < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :image


  validates :description, presence: true
  validates :price, presence: true
end
