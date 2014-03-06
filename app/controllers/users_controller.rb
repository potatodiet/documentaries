class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email_address,
        :password))

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url :notice => 'Signed up!'
    else
      flash.now.alert = 'Error'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @documentaries = Documentary.where(:uploader_user => params[:id])
  end
end
