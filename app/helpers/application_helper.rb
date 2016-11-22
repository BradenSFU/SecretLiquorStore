module ApplicationHelper

  def flash_message
    flash.map do |key, msg|
      content_tag :div, msg, :id => key, :class => 'flash'
    end.join
  end

  def add_to_likes(drink)
    #flash[:color] = green
    flash[:notice] = "You have added " + drink['strDrink'] + " to your likes"
    #current_user.likes << drink
    #current_user.likes.index(current_user.likes.size-1).islike = true
  end

  def add_to_dislikes(drink)
    #flash[:color] = red
    flash[:notice] = "You have added " + drink['strDrink'] + " to your dislikes"
    #current_user.likes << drink
    #current_user.likes.index(current_user.likes.size-1).islike = false
  end

  def remove_from_likes(drink)
  end

  def remove_from_dislikes(drink)
  end

end
