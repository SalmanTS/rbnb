class Scooter < ApplicationRecord
  belongs_to :user
  validates :end_of_contract, presence: true
  validates :start_of_contract, presence: true
end
