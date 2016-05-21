require 'test_helper'

class CustomFormFieldTest < ActiveSupport::TestCase

  test "extra_data_rel" do
    user = Client.create!(email: "ab1@ab.com.br")
    dt1 = ExtraDatum.create!(name: "dt1")
    dt2 = ExtraDatum.create!(name: "dt2")

    field1 = CustomFormTextField.create!(name: "Field1",user: user)

    field1.extra_data << dt1
    field1.extra_data << dt2

    assert_equal 2 , field1.extra_data.count
  end

  test "should_update_all_contacts_after_create" do
    user = Client.create!(email: "ab1@ab.com.br2")
    user2 = User.create!(email: "ab1@ab.com.br3", name:"name1")

    c = Contact.create!(user: user, contact: user2)

    count_before = user.contacts.first.contacts_custom_form_fields.count
    field1 = CustomFormTextField.create!(name: "Field1",user: user)
    count_after = user.contacts.first.contacts_custom_form_fields.count

    assert_equal count_before, count_after - 1
  end

end
