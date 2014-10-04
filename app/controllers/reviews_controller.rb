class ReviewsController < ApplicationController
  load_and_authorize_resource

  def create
    review = Review.new(review_params)
    review.reviewer = current_user

    if params[:review][:is_positive] == "true"
      review.documentary.likes += 1
      review.documentary.total_rating += 1
    else
      review.documentary.dislikes += 1
      review.documentary.total_rating -= 1
    end

    review.save
    review.documentary.save

    redirect_to(:back)
  end

  def update
    review = Review.where(documentary_id: params[:review][:documentary_id], reviewer_id: current_user.id).first

    if params[:review][:is_positive] != review.is_positive.to_s
      if params[:review][:is_positive] == "true"
        review.documentary.likes += 1
        review.documentary.dislikes -= 1
        review.documentary.total_rating += 2
      else
        review.documentary.likes -= 1
        review.documentary.dislikes += 1
        review.documentary.total_rating -= 2
      end
    end

    review.update(review_params)
    review.documentary.save

    redirect_to(:back)
  end

private
  def review_params
    params.require(:review).permit(:message, :is_positive, :documentary_id)
  end
end
