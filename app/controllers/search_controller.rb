class SearchController < ApplicationController
  def index
    @documentaries = Documentary.where('title LIKE ? or category LIKE ?', params[:search], params[:search])
                                .paginate(:page => params[:page]).order('total_rating DESC')
  end
end
