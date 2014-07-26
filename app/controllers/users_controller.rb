class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @documentaries = @user.documentaries.order('created_at desc').paginate(page: params[:page])
  end
end
