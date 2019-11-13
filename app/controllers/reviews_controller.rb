class ReviewsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    relationship = user.relationships & current_user.relationships
    if relationship.size > 0
      review = Review.new(comment: params[:comment], user: user)
      if reviews.save
        render json: {review: review}
      else
        render json: {message: "Unable to save", error: review.errors.full_messages}
      end
    else
      render json: {message: "No relationship found with this user"}
    end
  end

  def index
    user = current_user
    reviews= user.reviews
    render json: {reviews: reviews}
  end

end
