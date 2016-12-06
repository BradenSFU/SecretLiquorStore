require 'test_helper'

class ProfileEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:UserA)
  end

  test "unsuccessful edit with an empty username" do
    get edit_user_path(@user), params: {Username:  ""}
    assert flash.empty?
  end
  test "unsuccessful edit with an empty email" do
    get edit_user_path(@user), params: {Email: ""}
    assert flash.empty?
  end
end
