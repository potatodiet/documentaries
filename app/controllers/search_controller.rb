class SearchController < ApplicationController
  authorize_resource(:class => false)
  
  def index
    @documentaries = Documentary.tagged_with(params[:search])
                                .order('created_at DESC')
                                .paginate(:page => params[:page])
  end
end
