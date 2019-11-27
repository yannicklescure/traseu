class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search]
  def search
    @itineraries =
  end
end
