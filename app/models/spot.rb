class Spot < ApplicationRecord
  belongs_to :city
  has_many :itinerary_spots
  validates :title, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
end
