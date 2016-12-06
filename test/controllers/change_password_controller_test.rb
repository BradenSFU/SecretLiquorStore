require 'test_helper'

class ChangePasswordControllerTest < ActionDispatch::IntegrationTest
test "should get reset" do
  get reset_password_url
  assert_response :success
end

end
