class Spot < ApplicationRecord
  belongs_to :city
  belongs_to :category
  has_many :itinerary_spots, dependent: :destroy

  validates :title, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
end
