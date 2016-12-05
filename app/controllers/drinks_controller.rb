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
  # puts params[:searchBarDrink]
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

helper_method :api_drink_add_like
def api_drink_add_like(api_drink)
  @publish = Publish.new
  @publish = create_publish(api_drink)
  @publish.save
  return add_like_publish_path(@publish)
end

helper_method :api_drink_add_dislike
def api_drink_add_dislike(api_drink)
  @publish = Publish.new
  @publish = create_publish(api_drink)
  @publish.save
  return add_dislike_publish_path(@publish)
end

helper_method :create_publish
def create_publish(api_drink)
  @publish.id = Publish.all.size
  @publish.image = api_drink['strDrinkThumb']
  @publish.name = api_drink['strDrink']
  for i in 1..15 do
    next if api_drink["strIngredient#{i}"] == ""
    @ingredient = Ingredient.new
    @ingredient.name = api_drink["strMeasure#{i}"] + api_drink["strIngredient#{i}"]
    @publish.ingredients << @ingredient
    @ingredient.save
  end
  @publish.instructions = api_drink['strInstructions']
  return @publish
end

end
