module ApplicationHelper

  def flash_message
    #flash.map do |key, msg|
    #  content_tag :div, msg, :id => key, :class => 'flash'
    #end.join
  end

  def add_to_likes(drink)
    #flash[:color] = green
    #flash[:notice] = "You have added " + drink['strDrink'] + " to your likes"
    #Find drink by id
    #like = Like.new("islike" => "true", "drink_id" => "1", "user_id" => "1")
  end

  def add_to_dislikes(drink)
    #flash[:color] = red
    #flash[:notice] = "You have added " + drink['strDrink'] + " to your dislikes"
    #Find drink by id
    #like = Like.new("islike" => "false", "drink_id" => "1", "user_id" => "1")
  end

  def remove_from_likes(drink)
  end

  def remove_from_dislikes(drink)
  end

end
