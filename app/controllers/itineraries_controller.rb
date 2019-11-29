class ItinerariesController < ApplicationController

  def new
    if params[:query]
      @itinerary = Itinerary.find(params[:itinerary])
      @bookmarks = Itinerary.where(bookmark: true)
      case params[:query]
      when "create"
        # raise
        @itinerary.bookmark = true
        @itinerary.save!
      when "delete"
        # raise
        @itinerary.bookmark = false
        @itinerary.save!
      end
    end
    # http://localhost:3000/itineraries/new?
    # utf8=%E2%9C%93
    # &search%5Bexperience%5D=party
    # &search%5Bcountry%5D=peru
    # &search%5Bbudget%5D=1000
    # &search%5Bdays%5D=15&commit=Create+Search
    @search = Search.new(search_params)
    @search.user = current_user
    @search.save
    # raise
    # @search = Search.last
    @new_itinerary = Itinerary.new
    @itineraries = Itinerary.where(
      "country = ? OR experience = ?",
      params[:search][:country],
      params[:search][:experience]
    )
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary][:id])
    if @itinerary.user == current_user
      redirect_to itinerary_path(@itinerary)
    else
      @new_itinerary = Itinerary.new(@itinerary.attributes)
      @new_itinerary.id = nil
      @new_itinerary.user = current_user
      @new_itinerary.bookmark = true
      if @new_itinerary.save
        @itinerary.itinerary_cities.each do |itinerary_city|
          new_itinerary_city = ItineraryCity.new(itinerary_city.attributes)
          new_itinerary_city.id = nil
          new_itinerary_city.itinerary = @new_itinerary
          new_itinerary_city.save
        end
        @itinerary.itinerary_spots.each do |itinerary_spot|
          new_itinerary_spot = ItinerarySpot.new(itinerary_spot.attributes)
          new_itinerary_spot.id = nil
          new_itinerary_spot.itinerary = @new_itinerary
          new_itinerary_spot.save
        end
        redirect_to itinerary_path(@new_itinerary)
      else
        raise
        render :new
      end
    end
  end

  def show
    # binding.pry
    @cities = City.all
    @itinerary = Itinerary.find(params[:id])
    @itineraries = Itinerary.where(bookmark: true)
    # @itineraries = Itinerary.cities.all
    # raise
    case params[:query]
    when "create"
      @itinerary.bookmark = true
      @itinerary.save!
      # itinerary = Itinerary.find(params[:itinerary])
      # redirect_to itinerary_path(itinerary)
      # raise
    when "delete"
      # raise
      @itinerary.bookmark = false
      @itinerary.save!
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    # raise
    redirect_to searches_path
  end

  private

  def search_params
    params.require(:search).permit(:country, :experience, :budget, :days, :query, :itinerary)
  end
end
