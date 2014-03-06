class WelcomeController < ApplicationController
  def index
    @best_documentaries = Documentary.order('total_rating DESC').limit(4)
    @random_documentaries = Documentary.all.sample(4)
  end
end
