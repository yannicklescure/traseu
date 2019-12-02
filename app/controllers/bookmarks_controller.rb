class BookmarksController < ApplicationController

  def index
    @itineraries = Itinerary.where(bookmark: true)
    if params[:query]
      @itinerary = Itinerary.find(params[:itinerary])
      if params[:query] == "delete"
        @itinerary.bookmark = false
        @itinerary.save
        @delete = true
        # raise
      end
    end
  end
end
