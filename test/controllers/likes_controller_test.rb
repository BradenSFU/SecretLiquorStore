require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one)
  end

  test "should get new" do
    get likes_url
    assert_response :success
  end

  test "should destroy like" do
    assert_difference('Like.count', -1) do
      delete like_url(@like)
    end
  end
end
