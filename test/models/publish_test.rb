require 'test_helper'

class PublishTest < ActiveSupport::TestCase
  setup do
   @publish = Publish.new(Rname: "can create", ingredients: "can", instructions: "create")
 end
 test "vaild publish" do
 publish = @publish
 assert publish.valid?
 end
end
