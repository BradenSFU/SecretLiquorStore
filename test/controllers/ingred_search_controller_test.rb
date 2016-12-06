require 'test_helper'

class IngredSearchControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ingred1 = 'Applejack'
    @ingred2 = 'Dark Rum'
    @ingred3 = 'Light Rum'
  end

  test "searching one ingredient" do
    get ingred_search_url(:one => @ingred1)
    assert_response :success
  end

  test "searching multiple ingredients" do
    get ingred_search_url(:one => @ingred1, :two => @ingred2, :three => @ingred3)
    assert_response :success
  end


end
