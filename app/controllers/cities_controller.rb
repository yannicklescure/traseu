class CitiesController < ApplicationController
  def show
    #@navbar_transparent = true
    @restaurants = Spot.where("city_id = ? AND category_id = 1", params[:id])
    @hotels = Spot.where("city_id = ? AND category_id = 2", params[:id])
    @activities = Spot.where("city_id = ? AND category_id = 3", params[:id])
    @city = City.find(params[:id])
    # raise
  end
end
