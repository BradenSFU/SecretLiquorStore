require 'test_helper'

class PublishTest < ActiveSupport::TestCase
  setup do
   @publish = Publish.new(name: "can create",  instructions: "more")
 end
 test "vaild publish" do
 publish = @publish
 assert publish.valid?
 end
 test "missing name" do
   publish = @publish
   publish.name = nil
   assert !publish.valid?
 end
 test "missing instructions" do
   publish = @publish
   publish.instructions = nil
   assert !publish.valid?
 end
end
