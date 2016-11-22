require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(Username: "can create", Email: "can@email.com", Biography: "I am can create",
    Password: "123456",Password_confirmation: "123456", Isadmin: true, id: "1")
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
  end
end
