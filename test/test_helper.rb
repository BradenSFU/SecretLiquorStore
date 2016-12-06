ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  module SignInHelper
    def login(who)
     open_session do |i|
       i.extend(SignInHelper)
       who = users(:UserA)
       i.get "/log_in", params: { username: who.Username,
         password: who.Password }
       assert_response :success
     end
  end
end

class ActionDispatch::IntegrationTest
  include SignInHelper
end
end
  # Add more helper methods to be used by all tests here...
