class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :sort_by_popular_drinks
  def sort_by_popular_drinks
    Publish.joins(:likes).group("publishes.id").merge(Like.where(:islike => true).order(count: :desc))
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
