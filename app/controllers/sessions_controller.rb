class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email],params[:Password])
    if user
      session[:user_id] = user.id
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    session[:user_id]=nil
  end
end
