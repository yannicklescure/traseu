class Spot < ApplicationRecord
  belongs_to :city
  belongs_to :category
  has_many :itinerary_spots

  validates :title, presence: true
  # validates :address, presence: true
  # validates :city, presence: true
  validates :zip_code, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
