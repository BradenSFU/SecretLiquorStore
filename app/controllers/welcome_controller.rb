class WelcomeController < ApplicationController
  def index
  end
  def drink
    url = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{params[:drinkName]}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    if parsed['drinks'] == nil
      format.html { redirect_to 404_url }
    @drink = parsed['drinks']
  end
end
