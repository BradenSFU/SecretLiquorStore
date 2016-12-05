require 'test_helper'

class DrinkSearchTest < ActionDispatch::IntegrationTest
  setup do
    @drink = 'Jade'
    @notdrink = 'a'
  end

  test 'search existing drink name' do
    get drink_search_url,
    params: {searchBarDrink: @drink}
    response.should render_template('show')
  end

  test 'search not existing drink name' do
    get drink_search_url,
    params: {searchBarDrink: @notdrink}
    response.should render_template('drinkresults')
  end


end
