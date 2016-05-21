require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "need e-mail" do
    u = User.new
    assert !u.valid?
  end

  test "client_needs_password" do
    c = Client.new
    c.email = "teste@teste.com.br"
    assert !c.valid?
  end

  test "comman_user_does_not_need_password" do
    u = User.new
    u.email = "teste@teste.com.br"
    assert u.valid?
  end
end
