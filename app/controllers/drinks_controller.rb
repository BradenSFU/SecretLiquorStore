class DrinksController < ApplicationController
def show
  # @drink = params[:drink]
end

def drinksearch
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

end
