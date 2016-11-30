class IngredSearchController < ApplicationController

  def ingredSearch

    #params[:ingredient]
    @string = "gin"
    puts @string
    counter = 1
    #url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{params[:ingredient]}"
    url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{@string}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    resultsArry= Array.new
    if parsed['drinks'] == nil
      redirect_to error_404_url
    else
      if parsed['drinks'][0]['strDrink'] != @string
        @results = parsed['drinks']
        @firstentry = @results[0]
        #puts @results
        #puts @firstentry
        @results.each do |item|
          #puts item['strDrink']
          resultsArry.push([item['strDrink'],counter])
        end
        #puts resultsArry[0] #I HAVE DONE IT NOW I REITERATE HERE USING SECOND STRING
        #puts resultsArry[1]
        #puts resultsArry[2]   #[0] for (name,counter) [0][0] for name [0][1] for counter
      end
    end
  end
  helper_method :ingredSearch

  def show
    #params[:ingredient]
    @string = "water"
    @stringarr = ['gin','water']
    #puts @string
    counter =1
    @resultsArry= Array.new
    @checkArray = Array.new
    @hash = Hash.new
    @stringarr.each do |item|
      puts item
      url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{item}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      parsed = JSON.parse(response)
      if parsed['drinks'] == nil
        redirect_to error_404_url
      else
        if parsed['drinks'][0]['strDrink'] != item
          @results = parsed['drinks']
          @results.each do |item|
            @checkArray.push([item['strDrink'],counter])

          end
        end
        counter = counter +1
      end

    end

=begin
    counter = 1
    #url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{params[:ingredient]}"
    url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{@string}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    if parsed['drinks'] == nil
      redirect_to error_404_url
    else
      if parsed['drinks'][0]['strDrink'] != @string
        @results = parsed['drinks']
        @firstentry = @results[0]
        #puts @results
        #puts @firstentry
        @results.each do |item|
          #puts item['strDrink']
          @resultsArry.push([item['strDrink'],counter])
          #keyval = {'strDrink' =>item['strDrink'], 'counter' => counter}
          #puts keyval
          #@hash.merge!(keyval)
        end
        #puts @resultsArry[0] #I HAVE DONE IT NOW I REITERATE HERE USING SECOND STRING
        #puts @resultsArry[1]
        #puts @resultsArry[2]   #[0] for (name,counter) [0][0] for name [0][1] for counter
      #  puts @hash['strDrink']
      end
    end
=end
  end
end
