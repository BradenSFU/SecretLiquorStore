require 'test_helper'

class DrinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drink = 'Jade'
    @notdrink = 'a'
    @gibberish = 'ccvwrvc'
  end

  test "search existing drink" do
    get drink_search_url(:searchBarDrink => @drink)
    assert_response :success
  end

  test "search not existing drink with results" do
    get drink_search_url(:searchBarDrink => @notdrink)
    assert_response :success
  end

  test "search not existing drink with no results" do
    get drink_search_url(:searchBarDrink => @gibberish)
    assert_response :found
  end

end
