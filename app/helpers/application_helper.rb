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

end
