class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :scooter

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

# Method to calculate the total price
  def total_price
    return 0 unless start_date && end_date && price_per_day
    duration_in_days * price_per_day
  end


    # Custom validation to ensure end_date is after start_date
    # def end_date_after_start_date
    #   if start_date.present? && end_date.present? && end_date <= start_date
    #     errors.add(:end_date, "must be after the start date")
    #   end
    # end

    # Method to disable booked dates
  # def unavailable_dates
  #   bookings.pluck(:start_date, :end_date).map do |range|
  #     { from: range[start_date], to: range[end_date] }
  #   end
  # end


end
