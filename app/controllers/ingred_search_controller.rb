class IngredSearchController < ApplicationController

  def ingredSearch

  end

  def show
    #params[:ingredient]

    @stringarr = ['light rum','ginger beer']
    #puts @string
    counter =1 #counter for occurences found
    @loopcounter=0 #only used for first loop to populate globalarray
    @found = 0 #boolean for whether we found the item in the globalarray
    @GlobalArray = Array.new
    @LoopArray = Array.new

    params.each do |item|
      if !(['utf8', 'button', 'controller', 'action'].include? item)

      #puts @loopcounter
      puts item
      url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{item}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      parsed = JSON.parse(response)
      if parsed['drinks'] == nil
        puts error
        redirect_to error_404_url
      elsif @loopcounter == 0 # first loop only, populates @GlobalArray
        puts "entered first loop"
        @loopcounter = @loopcounter+1
        @results = parsed['drinks']
        @results.each do |item|
          @GlobalArray.push([item['strDrink'],counter])
        end
        #puts @GlobalArray[0][1]
      else #loopcounter isnt 0; we start making localArrays
        puts "entered second+ loop"
        if parsed['drinks'][0]['strDrink'] != item
          @results = parsed['drinks']
          @results.each do |item| #populate local array
            @LoopArray.push([item['strDrink'],counter])
          end
          @LoopArray.each do |item| #take the item in the search..

            @GlobalArray.each do |gitem| #..and compare with @GlobalArray
              #puts item[0]
              #puts gitem[0]
              if item[0] == gitem[0] #compares name
                puts "#{item[0]} == #{gitem[0]}"
                gitem[1] = gitem[1] +1 #if true, we increment the counter attribute & change the found variable to 1
                @found = 1
              end
            end

            if @found == 0 #if we didnt find the drink we push the drink into our global array
              @GlobalArray.push(item)
            end

            @found = 0 #we set the found variable back to 0 every item in the local array

          end
        end
        end
      end
    end
  end
end
