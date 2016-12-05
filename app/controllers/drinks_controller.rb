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
  @published = Publish.all
  @publishresults = Array.new
  # Search through published drinks for matches
  @published.each do |drink|
    if drink.id > 0
      if drink.name.include? params[:searchBarDrink]
        @publishresults.push(drink)
      end
    end
  end
  # puts params[:searchBarDrink]
  url = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{params[:searchBarDrink]}"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  parsed = JSON.parse(response)
  if parsed['drinks'] == nil && @publishresults.count == 0
    redirect_to root_url
    flash.alert = "No matched drinks found"
  elsif parsed['drinks'] == nil || parsed['drinks'][0]['strDrink'] != params[:searchBarDrink]
      @APIresults = parsed['drinks']
      render "drinkresults"
  else
      @drink = parsed['drinks'][0]
      render "show"
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
