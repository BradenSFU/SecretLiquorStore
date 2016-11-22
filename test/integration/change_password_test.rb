require 'test_helper'

class ChangepasswordTest < ActionDispatch::IntegrationTest
  test "Cannot change password" do
    get change_password_path,
    params: {Email: "le.email.com", Password: "", Password_confirmation: ""}
    assert flash.empty?
  end
  test "Cannot reset password" do
    get reset_password_path,
    params: {Email: "le.email.com", Password: "", Password_confirmation: ""}
    assert flash.empty?
end
#:Username, :Password, :Password_confirmation, :Email, :Biography, :Isadmin
