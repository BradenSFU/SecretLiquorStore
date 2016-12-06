require 'test_helper'

class ChangepasswordTest < ActionDispatch::IntegrationTest
  setup do
   @user = User.new(Username: "can create", Email: "can@email.com", Biography: "I am can create",
   Password: "123456",Password_confirmation: "123456", Isadmin: true)
 end
  #test "Cannot change password" do
    #login(@user)
    #get change_password_path, params: {user: {email: @user.Email, old_password: "123456", password: "", password_confirmation: ""}}
    #assert !flash.empty?
  #end
  test "Cannot set new password" do
    get reset_password_path,
    params: {email: "le@email.com", password: "", password_confirmation: ""}
    assert !flash.empty?
  end
  test "can set new password" do
    get reset_password_path,
    params: {email:"a@email.com", password: "123456", password_confirmation: "123456"}
    assert !flash.empty?
  end
end
#:Username, :Password, :Password_confirmation, :Email, :Biography, :Isadmin
