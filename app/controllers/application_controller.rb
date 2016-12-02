class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :sort_by_popular_drinks
  def sort_by_popular_drinks
    Publish
    .joins(:likes)
    .where(["likes.islike"])
    .group("publishes.id")
    .order("publishes.id DESC")
  end

end
