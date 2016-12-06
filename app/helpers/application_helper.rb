module ApplicationHelper

  def flash_message
    flash.map do |key, msg|
      content_tag :div, msg, :id => key, :class => 'flash'
    end.join
  end

  def count_like(drink)
     drink.likes.where(islike: true).count
  end

  def count_dislike(drink)
     drink.likes.where(islike: false).count
  end

  def sort_by_popular_drinks
    Publish.joins(:likes).group("publishes.id").merge(Like.where(:islike => true).order(count: :desc))
  end

  def drink_in_database(name)
    begin
      @oneDrink = Publish.find(:name => name)
    rescue ActiveRecord::RecordNotFound
      return nil
    end
    return @oneDrink
  end

  def ingredient_in_database(name)
    begin
      @oneIngredient = Ingredient.find(:name => name)
    rescue ActiveRecord::RecordNotFound
      return nil
    end
    return @oneIngredient
  end

end
