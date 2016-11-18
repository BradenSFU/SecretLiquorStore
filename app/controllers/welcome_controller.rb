  class WelcomeController < ApplicationController
  before_filter :randomvariable
  def index
  end
  def drink

    if params[:searchBarDrink] == ''
      redirect_to error_404_url
    end
    params[:searchBarDrink].gsub(/[']/, '\%27')
    puts params[:searchBarDrink]
    url = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{params[:searchBarDrink]}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    if parsed['drinks'] == nil
      redirect_to error_404_url
    else
      @drink = parsed['drinks'][0]
      if @drink['strDrink'] != params[:searchBarDrink]
        # @results = parsed['drinks']
        # redirect_to searchDrink_results_url
      end
    end
  end

  def randomvariable
    @rannum = rand(2886)

  end


end
