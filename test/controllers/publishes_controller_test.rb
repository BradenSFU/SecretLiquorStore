require 'test_helper'

class PublishesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @publish = publishes(:one)
    @user = users(:UserA)
  end
  test "should show publish" do
    get publish_url(@publish)
    assert_response :success
  end
end
