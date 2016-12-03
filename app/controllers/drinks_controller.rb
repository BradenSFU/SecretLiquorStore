class DrinksController < ApplicationController
def show
  if @drink == nil
    @drink = params[:drink]
  end
end

def drinksearch
  if params[:searchBarDrink] == ''
    redirect_to root_url
  end
  params[:searchBarDrink].gsub!("'", '\%27')
  puts params[:searchBarDrink]
  url = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{params[:searchBarDrink]}"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  parsed = JSON.parse(response)
  if parsed['drinks'] == nil
    redirect_to root_url
    flash.alert = "No matched drinks found"
  else
    if parsed['drinks'][0]['strDrink'] != params[:searchBarDrink]
      @results = parsed['drinks']
      render "drinkresults"
    else
      @drink = parsed['drinks'][0]
      render "show"
    end
  end
end

def drinkresults
  # @results = params[:results]
  if params[:page] == nil
    @page = 1
  else
    @page = params[:page]
  end
  @pagerange = @results[(@page.to_i-1)*10..[@page.to_i*10-1, @results.size-1].min]
end

def add_like(api_drink)
  create_publish_and_vote(api_drink, true)
end

def add_dislike(api_drink)
  create_publish_and_vote(api_drink, false)
end

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
