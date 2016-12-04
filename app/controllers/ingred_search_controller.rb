class IngredSearchController < ApplicationController

  def ingredstartsearch

  end

  def show
    #params[:ingredient]

    #puts @string
    counter = 1 #counter for occurences found
    # @found = 0 #boolean for whether we found the item in the globalarray
    # @LoopArray = Array.new
    @GlobalArray = Array.new
    # @ingredDB = Ingredient.

    params.each do |id, ingred|
      # @LoopArray.clear
      if !(['utf8', 'button', 'controller', 'action'].include? id)

        #puts @loopcounter
        url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingred}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        parsed = JSON.parse(response)
        if parsed['drinks'] == nil
          puts 'nil return'
        else
          # puts "entered first loop"
          @results = parsed['drinks']
          @results.each do |item|
            item['strDrink'].gsub!("'", '\%27')
            if @GlobalArray.count == 0
              @GlobalArray.push([item['strDrink'],counter])
            else
              found = 0
              @GlobalArray.each do |gitem|
                if gitem[0] == item['strDrink']
                  gitem[1] += 1
                  found = 1
                  break
                end
              end
              if found == 0
                @GlobalArray.push([item['strDrink'],counter])
              end
            end
          end
          #puts @GlobalArray[0][1]
        # else #loopcounter isnt 0; we start making localArrays
        #   # puts "entered second+ loop"
        #   @results = parsed['drinks']
        #   @results.each do |item| #populate local array
        #     item['strDrink'].gsub!("'", '\%27')
        #     if
        #     @LoopArray.push([item['strDrink'],counter])
        #   end
        #   @LoopArray.each do |item| #take the item in the search..
        #
        #     @GlobalArray.each do |gitem| #..and compare with @GlobalArray
        #       #puts item[0]
        #       #puts gitem[0]
        #       if item[0] == gitem[0] #compares name
        #         puts "#{item[0]} == #{gitem[0]}"
        #         gitem[1] = gitem[1] +1 #if true, we increment the counter attribute & change the found variable to 1
        #         @found = 1
        #       end
        #     end
        #
        #     if @found == 0 #if we didnt find the drink we push the drink into our global array
        #       @GlobalArray.push(item)
        #     end
        #
        #     @found = 0 #we set the found variable back to 0 every item in the local array
        #   end
        end
      end
    end
    @GlobalArray.sort! { |a, b| -a[1] <=> -b[1] }
    @GlobalArray.flatten!
    @page = 1
    @pagerange = @GlobalArray[(@page.to_i-1)*20..[@page.to_i*20-1, (@GlobalArray.size/2)-1].min]
    puts @pagerange
  end

  def pagehandler
    if params[:page] == nil
      @page = 1
    else
      @page = params[:page]
    end
    @GlobalArray = params[:results]
    # params seems to split the name, count pairs, so we need to fix it
    # tests = @GlobalArray.map { |name, count| [name, count] }
    @pagerange = @GlobalArray[(@page.to_i-1)*20..[@page.to_i*20-1, @GlobalArray.size-1].min]
    render 'show'
  end
end
