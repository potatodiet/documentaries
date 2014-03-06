class SearchController < ApplicationController
  def index
    @documentaries = Documentary.limit(12).where('title like ?',
        "%#{params[:search]}%")
    @users = User.limit(12).where('username like ?', "%#{params[:search]}%")
  end
end
