class ItinerariesController < ApplicationController
  def new
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
      @itinerary_new = Itinerary.new(@itinerary.attributes)
      @itinerary_new.id = nil
      @itinerary_new.user = current_user
      if @itinerary_new.save
        redirect_to itinerary_path(@itinerary_new)
      else
        render :new
      end
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:country, :experience, :budget, :days)
  end
end
