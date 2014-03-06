class DocumentariesController < ApplicationController
  def show
    @documentary = Documentary.where('lower(title) = ?',
        params[:title].gsub('-',' ')).first
    @documentary_user = User.find(@documentary.uploader_user).username
    @review = Review.where({user_id: session[:user_id],
    documentary_id: @documentary.id}).first || Review.new
    @reviews = Review.where('documentary_id' => @documentary.id)
  end

  def new
    @documentary = Documentary.new
    @select_list = ['youtube']
  end

  def create
    if !current_user
      return false
    end

    documentary = Documentary.new(params.require(:documentary).permit(:title,
        :description, :video_source, :video_service))
    documentary.uploader_user = session[:user_id]
    documentary.likes = 0
    documentary.dislikes = 0
    documentary.total_likes = 0;
    documentary.thumbnail_url = "https://img.youtube.com/vi/" \
        "#{params[:documentary][:video_source]}/mqdefault.jpg"
    documentary.save

    redirect_to root_url
  end
end
