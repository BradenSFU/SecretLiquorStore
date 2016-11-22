require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "Can create user" do
    get "/users/new"
    assert_response :success
    post "/users",
    params: { user: {Username: "can create", Email: "can@email.com", Biography: "I am can create", Password: "123456",
      Password_confirmation:"123456", Isadmin: +}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
#:Username, :Password, :Password_confirmation, :Email, :Biography, :Isadmin
