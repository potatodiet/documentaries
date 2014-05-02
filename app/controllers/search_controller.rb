class SearchController < ApplicationController
  def index
    category_search = params[:search][/"([^"]*)"/]

    if category_search
      category_search = category_search.split(':')[1].tr('"', '')
      without_category = params[:search].slice(category_search)
      @documentaries = Documentary.where('title like ? or description like' \
          ' ? or category like ?', "%#{without_category}%", "%#{without_category}%",
          "%#{category_search}%").paginate(:page => params[:page]).order('total_rating DESC')
    else
      @documentaries = Documentary.where('title like ? or description like ?
          or category like ? ', "%#{params[:search]}%", "%#{params[:search]}%", 
          "%#{params[:search]}%").paginate(:page => params[:page]).order('total_rating DESC')
    end
  end
end
