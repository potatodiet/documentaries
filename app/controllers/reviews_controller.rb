class ReviewsController < ApplicationController
  def create
    if !current_user
      return false
    end

    review = Review.new(params.require(:review).permit(:message, :is_positive,
        :documentary_id))
    review.user_id = session[:user_id]
    review.save

    documentary = Documentary.find(params[:review][:documentary_id])
    if params[:review][:is_positive] == 'true'
      documentary.likes += 1
      documentary.total_rating += 1
    else
      documentary.dislikes += 1
      documentary.total_rating -= 1
    end
    documentary.save

    redirect_to :back
  end

  def update
    if !current_user
      return false
    end

    review = Review.where('user_id' => session[:user_id],
        'documentary_id' => params[:review][:documentary_id]).first

    documentary = Documentary.find(params[:review][:documentary_id])
    if params[:review][:is_positive] != review.is_positive.to_s
      if params[:review][:is_positive] == 'true'
        documentary.likes += 1
        documentary.dislikes -= 1
        documentary.total_rating += 2
      else
        documentary.likes -= 1
        documentary.dislikes += 1
        documentary.total_rating -= 2
      end
    end
    documentary.save

    review.message = params[:review][:message]
    review.is_positive = params[:review][:is_positive]
    review.save

    redirect_to :back
  end
end
