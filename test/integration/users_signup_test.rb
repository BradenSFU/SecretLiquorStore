require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  post users_path, params[:Username ="" :Email ="user@invalid" :Password ="123"]
    :"user@invalid",
    Password:"123"
    Password_confirmation:"111"}}
  end
  assert_template 'users/new'
end
#:Username, :Password, :Password_confirmation, :Email, :Biography, :Isadmin
