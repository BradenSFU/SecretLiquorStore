require 'test_helper'

class DrinkSearchTest < ActionDispatch::IntegrationTest
  setup do
    @drink = 'Jade'
    @notdrink = 'a'
  end

  # test 'search existing drink name' do
  #
  # end

  test 'search not existing drink name' do
    get drink_search_url,
    params: {searchBarDrink: @notdrink}
    assert_template :searchresults
  end


end
