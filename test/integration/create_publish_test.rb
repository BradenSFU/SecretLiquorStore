require 'test_helper'

class CreatePublishTest < ActionDispatch::IntegrationTest
  test "should create publishes" do
    @publish = Publish.new
    redirect_to add_like_publish_path(@publish)
    assert(@publish.likes.valid?)
  end
end
