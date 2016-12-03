class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :sort_by_popular_drinks
  def sort_by_popular_drinks
    #Publish.all(:order => "likes_total DESC")
    Publish
    .joins(:likes)
    .where(["likes.islike"])
    .group("publishes.id")
    .order("publishes.id DESC")
    #Publish.first.likes.select("likes.islike, count(1) as like_count").group('likes.islike').order('like_count desc')
  end

  helper_method :drink_in_database
  def drink_in_database(name)
    begin
      @oneDrink = Publish.find(:name => name)
    rescue ActiveRecord::RecordNotFound
      return nil
    end
    return @oneDrink
  end

end
