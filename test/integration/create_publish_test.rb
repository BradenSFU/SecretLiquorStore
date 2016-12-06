require 'test_helper'

class CreatePublishTest < ActionDispatch::IntegrationTest
  setup do
    @publish = publishes(:one)
    #Publish.new (name: "MyString", user_id: 1, drink_id: 1, instructions: "MyString", id: 2)
  end
end
