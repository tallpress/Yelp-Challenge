class ReviewsController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  before_action :authenticate_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = current_user
    @user.reviews.create(review_params)
    @review = @restaurant.reviews.create(review_params)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end

end
