class IngredSearchController < ApplicationController

  def ingredSearch
=begin
    #params[:ingredient]
    @string = "gin"
    puts @string
    counter = 1
    #url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{params[:ingredient]}"
    url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{@string}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    GlobalArray= Array.new
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
          GlobalArray.push([item['strDrink'],counter])
        end
        #puts GlobalArray[0] #I HAVE DONE IT NOW I REITERATE HERE USING SECOND STRING
        #puts GlobalArray[1]
        #puts GlobalArray[2]   #[0] for (name,counter) [0][0] for name [0][1] for counter
      end
    end
=end
  end
  helper_method :ingredSearch

  def show
    #params[:ingredient]
    @string = "water"
    @stringarr = ['light rum','ginger beer']
    #puts @string
    counter =1
    @loopcounter=0 #we storefirst
    @found = 0
    @GlobalArray = Array.new
    @LoopArray = Array.new
    @hash = Hash.new
    @stringarr.each do |item|
      #puts @loopcounter
      puts item
      url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{item}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      parsed = JSON.parse(response)
      if parsed['drinks'] == nil
        puts error
        redirect_to error_404_url
      elsif @loopcounter == 0 # first loop only
        puts "entered first loop"
        @loopcounter = @loopcounter+1
        @results = parsed['drinks']
        @results.each do |item|
          @GlobalArray.push([item['strDrink'],counter])
        end
        #puts @GlobalArray[0][1]
      else
        puts "entered second+ loop"
        if parsed['drinks'][0]['strDrink'] != item
          @results = parsed['drinks']
          @results.each do |item|
            @LoopArray.push([item['strDrink'],counter])
          end
          @LoopArray.each do |item|

            #puts "here"
=begin            puts item[0]
            puts @GlobalArray[@incounter]
            index = @GlobalArray[@incounter].index(item[0])
            puts "we are here: #{index}"
            if index == nil #not in globalarray
              @GlobalArray.push(item)
            else  #index !=nil inside global
              puts "INDEX FOUND @ " + index
              @GlobalArray[index][1] = @GlobalArray[index][1] +1
            end
            @incounter = @incounter+1
            puts @incounter
=end
            @GlobalArray.each do |gitem|
              #puts item[0]
              #puts gitem[0]
              if item[0] == gitem[0]
                puts "#{item[0]} == #{gitem[0]}"
                gitem[1] = gitem[1] +1
                @found = 1
              end
            end
            if @found == 0
              @GlobalArray.push(item)
            end
            @found = 0
          end
        end
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
          @GlobalArray.push([item['strDrink'],counter])
          #keyval = {'strDrink' =>item['strDrink'], 'counter' => counter}
          #puts keyval
          #@hash.merge!(keyval)
        end
        #puts @GlobalArray[0] #I HAVE DONE IT NOW I REITERATE HERE USING SECOND STRING
        #puts @GlobalArray[1]
        #puts @GlobalArray[2]   #[0] for (name,counter) [0][0] for name [0][1] for counter
      #  puts @hash['strDrink']
      end
    end
=end
  end
end
