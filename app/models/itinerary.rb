class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :itinerary_cities
  has_many :itinerary_spots

  validates :country, presence: true
  validates :experience, presence: true
  validates :budget, presence: true
  validates :days, presence: true
end
