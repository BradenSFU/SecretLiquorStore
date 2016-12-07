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
  test "should update publish" do
    publish = publishes(:one)
    patch publish_url(publish), params: { publish: { name: "New name" } }
    assert_redirected_to publish_path(publish)
  end
end
