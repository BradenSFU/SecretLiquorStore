require 'test_helper'

class SignInTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get log_in_path,
    params: {email: "", Password: ""}
    assert !flash.empty?
  end
  test "login with valid informations" do
    get log_in_path, params: { email: "a@email.com", password: "000000" }
    assert flash.empty?
  end
end
