require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ingredient = ingredients(:one)
  end

  test "should get index" do
    assert_response :success
  end

  test "should get new" do
    assert_response :success
  end

  test "should create ingredient" do
    assert_difference('Ingredient.count') do
      post ingredients_url, params: { ingredient: { name: @ingredient.name, publish_id: @ingredient.publish_id } }
    end
    assert_redirected_to ingredient_url(Ingredient.last)
  end

  test "should destroy ingredient" do
    assert_difference('Ingredient.count', -1) do
      delete ingredient_url(@ingredient)
    end
    assert_redirected_to ingredients_url
  end
end
