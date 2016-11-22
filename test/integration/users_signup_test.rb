require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "Can create user" do
    get "/sign_up",
    params: { user: {Username: "can create", Email: "can@email.com", Biography: "I am can create", Password: "123456",
      Password_confirmation:"123456", Isadmin: true}}
      assert_response :success
      get "/log_in",
      params: {user: {Username: "can create", Password: "123456"}}
    assert_response :success
  end
end
#:Username, :Password, :Password_confirmation, :Email, :Biography, :Isadmin
