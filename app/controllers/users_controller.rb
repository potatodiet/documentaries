class UsersController < ApplicationController
  load_and_authorize_resource
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to(root_path notice: 'Signed up!')
    else
      flash.now.alert = 'Error'
      render(:new)
    end
  end

  def show
    @user = User.find(params[:id])
    @documentaries = @user.documentaries.order('created_at desc').paginate(page: params[:page])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update(user_params)
      redirect_to(root_path)
    else
      render(:edit)
    end
  end
end

private
  def user_params
    params.require(:user).permit(:username, :email_address, :password)
  end
