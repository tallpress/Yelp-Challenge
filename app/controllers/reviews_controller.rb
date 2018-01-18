class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    if current_user.id != @restaurant.user_id
      if @restaurant.reviews.where("user_id = #{current_user.id}").empty?
        @review = @restaurant.reviews.new(review_params)  #a new active record object is created
        @review.user = current_user #the review is associated to an user
        @review.save #The review is saved to the db
      else
        flash[:alert] = "You can only review an establishment once"
      end
    else
      flash[:alert] = "It is against company policy to review your own restaurant"
    end
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end

end
