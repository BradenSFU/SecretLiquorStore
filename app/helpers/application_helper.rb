module ApplicationHelper

  def count_like(drink)
     drink.likes.where(islike: true).count
  end

  def count_dislike(drink)
     drink.likes.where(islike: false).count
  end

end
