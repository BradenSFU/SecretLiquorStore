class SessionsController < ApplicationController

  def new
    redirect_to root_url if current_user
  end

  def create
    user = User.authenticate(params[:email],params[:Password])
    if user
      session[:user_id] = user.id
      redirect_to just_logged_in_url #, :notice => "Logged in!"
    else
    #  flash.now[:notice] = "Invalid login"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
  #  redirect_to root_url, :notice => "Logged out"
  end
end
