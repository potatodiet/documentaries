class WelcomeController < ApplicationController
  authorize_resource(:class => false)
  
  def index
    @best_documentaries = Documentary.order("total_rating DESC").limit(4)
    @random_documentaries = Documentary.order("RANDOM()").limit(4)
  end
end
