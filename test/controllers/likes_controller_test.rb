require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one)
  end

  test "should create like" do
    assert_difference('Like.count') do
      post likes_url, params: { like: { publish_id: @like.publish_id, islike: @like.islike, user_id: @like.user_id } }
    end
  end

  test "should destroy like" do
    assert_difference('Like.count', -1) do
      delete like_url(@like)
    end
  end
end
