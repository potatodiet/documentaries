class SearchController < ApplicationController
  def index
    search_array = params[:search].split(',')
    search_array.each { |v| v.strip! }

    @documentaries = Documentary.where('title like ? or category like ?', search_array, search_array).paginate(:page => params[:page]).order('total_rating DESC')
  end
end
