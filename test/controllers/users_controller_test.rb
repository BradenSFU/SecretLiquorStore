require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(Username: "can create", Email: "can@email.com", Biography: "I am can create",
    Password: "123456",Password_confirmation: "123456", Isadmin: true)
  end


  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show user" do
    get :show, {'id' => '1'}, {'user_id' => '1'}
    get user_url(@user)
    assert_redirected_to @user
  end

  test "should get edit" do
    get :edit, params: {id: 1}
    get edit_user_url(@user)
    assert_response :success
  end

  test "should destroy user" do
    get :show, params: {id: 1}
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
  end
end
