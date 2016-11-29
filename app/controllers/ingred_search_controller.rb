class IngredSearchController < ApplicationController

  def ingredSearch

    #params[:ingredient]
    string = "gin"
    puts string
    #url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{params[:ingredient]}"
    url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{string}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    resultsArry= Array.new
    if parsed['drinks'] == nil
      redirect_to error_404_url
    else
      if parsed['drinks'][0]['strDrink'] != string
        @results = parsed['drinks']
        @firstentry = @results[0]
        #puts @results
        #puts @firstentry
        @results.each do |item|
          #puts item['strDrink']
          resultsArry.push(item['strDrink'])

        end
        puts resultsArry[1]
      else
        #@drink = parsed['drinks'][0]
        render "show"
      end
    end
  end
  helper_method :ingredSearch
end
