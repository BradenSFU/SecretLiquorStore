require 'test_helper'

class ChangePasswordControllerTest < ActionDispatch::IntegrationTest
 test "should get change" do
   get change_password_change_url
   assert_response :success
 end

test "should get reset" do
  get reset_password_url
  assert_response :success
end

end
