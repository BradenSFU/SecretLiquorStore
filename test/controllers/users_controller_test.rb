require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(Username: "can create", Email: "can@email.com", Biography: "I am can create",
    Password: "123456",Password_confirmation: "123456", Isadmin: false, id: "1")

  end
  test "should not get index" do
    get users_url (@user)
    assert_redirected_to root_url
    assert :success
  end

  test "should creat new user" do
    get sign_up_url(@user)
    assert :success
  end

  test "should show user profile" do
    get users_url (@user)
    assert :success
  end
end
