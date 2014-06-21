class SearchController < ApplicationController
  def index
    @documentaries = Documentary.tagged_with(params[:search].split(','))
                                .order('created_at desc')
                                .paginate(:page => params[:page])
  end
end
