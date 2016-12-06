require 'test_helper'

class DrinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drink = 'Jade'
    @notdrink = 'a'
  end

  test "should get drink info page" do
    get drink_show_url(@drink)
    assert_response :success
  end

end
