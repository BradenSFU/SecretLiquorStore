class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :add_to_likes
  def add_to_likes(publish)
    Like.create_vote(publish,current_user,true)
  end

  helper_method :add_to_dislikes
  def add_to_dislikes(publish)
    Like.create_vote(publish,current_user,false)
  end

  helper_method :remove_from_likes_list
  def remove_from_likes_list(publish)
    Like.remove_from_likes_list_on_model(publish,current_user)
  end
end
