ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::ControllerTest
  module CustomAssertion
    def login(who)
      open_session do |i|
        i.extend(CustomAssertion)
        who = user(:UserA)
        i.get "/log_in", params: { username: who.Username,
        password: who.Password }
        assert_response :success
      end
    end
  end
end
