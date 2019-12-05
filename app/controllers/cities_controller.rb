class CitiesController < ApplicationController
  def show
    #@navbar_transparent = true
    @restaurants = Spot.where("city_id = ? AND category_id = ?", params[:id], Category.find_by(name: "restaurant").id)
    @hotels = Spot.where("city_id = ? AND category_id = ?", params[:id], Category.find_by(name: "hotel").id)
    @activities = Spot.where("city_id = ? AND category_id = ?", params[:id], Category.find_by(name: "activity").id)
    @city = City.find(params[:id])
    # raise
  end
end
