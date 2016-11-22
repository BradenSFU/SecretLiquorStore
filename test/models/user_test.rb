require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
   @user = User.new(Username: "can create", Email: "can@email.com", Biography: "I am can create",
   Password: "123456",Password_confirmation: "123456", Isadmin: true)
 end
  test "vaild user" do
  user = @user
  assert user.valid?
  end
  test "user without an email" do
    user = @user
    user.Email = nil
    assert !user.valid?
  end
  test "user without username email" do
    user = @user
    user.Username = nil
    assert !user.valid?
  end
  test "user without an invalid email" do
    user = @user
    user.Email = "can.email.com"
    assert !user.valid?
  end
  test "user password is too short" do
    user = @user
    user.Password = 12345
    assert !user.valid?
  end
  test "user with wrong password confirmation" do
    user = @user
    user.Password_confirmation = 12345
    assert !user.valid?
  end
  test "valid user with no Biography" do
    user = @user
    user.Biography = nil
    assert user.valid?
  end
end
