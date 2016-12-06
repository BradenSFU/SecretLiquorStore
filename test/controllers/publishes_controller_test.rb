require 'test_helper'

class PublishesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @publish = publishes(:one)
  end
    test "should add like" do
      Publish.add_like
      assert @publish.likes.vaild?
    end
end
