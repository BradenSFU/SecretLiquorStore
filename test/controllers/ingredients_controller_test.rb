require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ingredient = ingredients(:one)
  end

  test "should get index" do
    get ingredients_url
    assert_response :success
  end

  test "should get new" do
    get ingredients_url
    assert_response :success
  end

  test "should destroy ingredient" do
    assert_difference('Ingredient.count', -1) do
      delete ingredient_url(@ingredient)
    end
    assert_redirected_to ingredients_url
  end
end
