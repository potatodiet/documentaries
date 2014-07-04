class SessionsController < ApplicationController
  authorize_resource(:class => false)
  
  def new
    @user = User.new
  end

  def create
    @user = User.authenticate(params[:user][:email_address], params[:user][:password])
    if @user
      session[:user_id] = @user.id

      redirect_to(root_path, notice: 'Signed in')
    else
      @user = User.new
      flash.now.alert = 'Invalid email or password'
      render(:new)
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to(root_path, notice: 'Signed out')
  end
end
