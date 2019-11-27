class City < ApplicationRecord
  has_many :itinerary_cities, dependent: :destroy
  has_many :spots, dependent: :destroy

  validates :name, presence: true
end
