class City < ApplicationRecord
  has_many :itinerary_cities
  has_many :spots

  validates :name, presence: true
end
