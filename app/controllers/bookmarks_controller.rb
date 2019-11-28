class BookmarksController < ApplicationController

  def index
    @itineraries = Itinerary.where(bookmark: true)
    if params[:query]
      @itinerary = Itinerary.find(params[:itinerary])
      case params[:query]
      when "delete"
        @itinerary.bookmark = false
        @itinerary.save
        @delete = true
        # raise
      when "create"
        @itinerary.bookmark = true
        @itinerary.save
        # raise
      end
    end
  end
end
