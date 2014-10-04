class DocumentariesController < ApplicationController
  load_and_authorize_resource
  
  def show
    @documentary = Documentary.find(params[:id])
    @review = @documentary.reviews.where(reviewer: current_user).first || Review.new
    @reviews = @documentary.reviews.order("updated_at asc")
  end

  def new
    @documentary = Documentary.new
  end

  def create
    @documentary = Documentary.new(documentary_params)
    @documentary.uploader = current_user

    if @documentary.save
      redirect_to(documentary_path(@documentary), notice: "Documentary created")
    else
      flash.now.alert = "Error"
      render(:new)
    end
  end

  def edit
    @documentary = Documentary.find(params[:id])
  end

  def update
    @documentary = Documentary.find(params[:id])

    if @documentary.update(documentary_params)
      redirect_to(documentary_path(@documentary))
    else
      render(:edit)
    end
  end

  def destroy
    @documentary = Documentary.find(params[:id])

    if @documentary.destroy
      redirect_to(root_path, notice: "Destroyed Documentary")
    else
      render(:edit)
    end
  end
end

private
  def documentary_params
    params.require(:documentary).permit(
      :title, :description, :video_source, :video_service, :tag_list
    )
  end
