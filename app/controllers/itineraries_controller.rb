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
    raise
  end

  private

  def search_params
    params.require(:search).permit(:country, :experience, :budget, :days)
  end
end
