class SessionsController < ApplicationController
  authorize_resource(:class => false)
  
  def new
    @user = User.new
  end

  def create
    @user = User.authenticate(params[:user][:username], params[:user][:username])

    if @user
      session[:user_id] = @user.id

      redirect_to(root_path, notice: 'Signed in')
    else
      @user = User.new(username: params[:user][:username])
      flash.now.alert = 'Invalid username or password'
      render(:new)
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to(root_path, notice: 'Signed out')
  end
end
