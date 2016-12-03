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

  helper_method :like_API_drink
  def like_API_drink(api_drink)
    create_publish_and_vote(api_drink, true)
  end

  helper_method :dislike_API_drink
  def dislike_API_drink(api_drink)
    create_publish_and_vote(api_drink, false)
  end

  private
  def create_publish_and_vote(api_drink, vote)
    @publish = Publish.new
    @publish.user_id = 21421352
    @publish.name = api_drink['strDrink']
    for i in 1..15 do
      next if api_drink["strIngredient#{i}"] == ""
      @ingredient = Ingredient.new
      @ingredient.publish_id = 2134235
      @ingredient.name = api_drink["strMeasure#{i}"] + api_drink["strIngredient#{i}"]
      @publish.ingredients << @ingredient
      @ingredient.save
    end
    @publish.instructions = api_drink['strInstructions']
    @publish.save
    @like = Like.new
    @like.islike = true
    @like.user_id = current_user
    @like.publish_id = 2134235
    @like.save
  end

end
