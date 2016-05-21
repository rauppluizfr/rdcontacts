require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "need e-mail" do
    u = User.new
    assert !u.valid?
  end
end
