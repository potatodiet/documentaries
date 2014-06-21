class SearchController < ApplicationController
  authorize_resource(:class => false)
  
  def index
    @documentaries = Documentary.tagged_with(params[:search].split(','))
                                .order('created_at desc')
                                .paginate(:page => params[:page])
  end
end
