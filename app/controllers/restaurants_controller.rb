class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name, :restaurant_cuisine,
      :restaurant_price, :restaurant_address)
  end

end
