class Scooter < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :images


  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :model, presence: true
  validates :images, presence: true

end
