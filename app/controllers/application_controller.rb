class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :add_to_likes
  def add_to_likes
    @like = Like.create
  end

  helper_method :add_to_dislikes
  def add_to_dislikes
    @like = Like.dislike
  end

  helper_method :remove_from_likes
  def add_to_dislikes
  end

  helper_method :remove_from_dislikes
  def remove_from_dislikes
  end
end
