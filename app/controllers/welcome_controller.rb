class WelcomeController < ApplicationController
  def index
  end
  def drink
    url = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{params[:searchBarDrink]}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    if parsed['drinks'] == nil
      format.html { redirect_to error_404_url }
    else
      @drink = parsed['drinks'][0]
    end
  end
end
