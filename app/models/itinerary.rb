class Itinerary < ApplicationRecord
  belongs_to :user

  validates :country, presence: true
  validates :experience, presence: true
  validates :budget, presence: true
  validates :days, presence: true
end
