class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    if current_user.id != @restaurant.user_id

      p '-------------------'
      p @restaurant.reviews
      # if current_user.id != @restaurant.reviews.find(current_user.id).user_id
      #    # @review = @restaurant.reviews.create(review_params.merge(user: current_user)) #I am creating a new object and also saving it directly to the DB, I need to merge the info about the user because it doesn't know it by default
        @review = @restaurant.reviews.new(review_params)  #a new active record object is created
        @review.user = current_user #the review is associated to an user
        @review.save #The review is saved to the db
      # else
      #   flash[:alert] = "You can only review an establishment once"
      # end
    else
      flash[:alert] = "It is against company policy to review your own restaurant"
      # flash[:alert] = "You can't review your own restaurant, that is crazy and against company policy"
      # requires a altert / render message to say that you can't review your own restuant
    end
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end

end
