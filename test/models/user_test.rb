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

  test "common_user_does_not_need_password" do
    u = User.new
    u.email = "teste@teste.com.br"
    assert u.valid?
  end

  test "abilities" do
    admin = Admin.create!(email: "ab1@ab.com.br", password: "12345678")
    client = Client.create!(email: "ab2@ab.com.br", password: "12345678")
    client2 = Client.create!(email: "ab3@ab.com.br", password: "12345678")
#admin can do everything
    ability = Ability.new(admin)
    assert ability.can?(:manage,client)
#client cannot manage a admin profile
    ability = Ability.new(client)
    assert ability.cannot?(:manage,admin)
#client can manage his profile
    ability = Ability.new(client)
    assert ability.can?(:manage,client)
#client cannot manage another client profile
    ability = Ability.new(client)
    assert ability.cannot?(:manage,client2)
  end
end
