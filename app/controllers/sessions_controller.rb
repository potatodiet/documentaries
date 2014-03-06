class SessionsController < ApplicationController
  def new
    if session[:user_id]
      flash.now.alert = 'You are already logged in'
      render :new
    end
  end

  def create
    puts params[:user][:email_address]
    user = User.authenticate(params[:user][:email_address], params[:user][:password])
    if user
      session[:user_id] = user.id

      redirect_to root_url, :notice => 'Signed in'
    else
      flash.now.alert = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_url, :notice => 'Signed out'
  end
end
