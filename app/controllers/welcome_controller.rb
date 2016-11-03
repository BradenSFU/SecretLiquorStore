class WelcomeController < ApplicationController
  def index
  end
  def drink
    url = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{params[:searchBarDrink]}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    if parsed['drinks'] == nil
      redirect_to error_404_url
    end
    @drink = parsed['drinks'][0]
    if @drink['strDrink'] != params[:searchBarDrink]
      # redirect_to rearch results page
    end
  end
end
