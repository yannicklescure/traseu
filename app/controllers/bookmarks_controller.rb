class BookmarksController < ApplicationController

  # def index
  #   @itineraries = Itinerary.where(bookmark: true)
  #   if params[:query]
  #     @itinerary = Itinerary.find(params[:itinerary])
  #     # if params[:query] == "delete"
  #       @itinerary.bookmark = false
  #       @itinerary.save
  #       # @delete = true
  #     # end
  #     # raise
  #   end
  # end

  def index
    @bookmarks = Bookmark.where(user: current_user.id)
  end

  def create
    @itinerary = Itinerary.find(params[:id])
    @bookmark = Bookmark.new(user: current_user, itinerary: @itinerary)
    @bookmark.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:itinerary])
    @bookmarks = Bookmark.where(user: current_user.id)
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    respond_to do |format|
      format.js
    end
  end
end
