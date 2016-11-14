class WelcomeController < ApplicationController
  before_filter :randomvariable
  def index
  end
  def drink
    
    if params[:searchBarDrink] == ''
      redirect_to error_404_url
    end
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

  def randomvariable
    @rannum = rand(2886)

  end


end
