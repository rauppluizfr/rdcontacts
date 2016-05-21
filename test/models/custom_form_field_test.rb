require 'test_helper'

class CustomFormFieldTest < ActiveSupport::TestCase

  test "extra_data_rel" do
    dt1 = ExtraDatum.create!(name: "dt1")
    dt2 = ExtraDatum.create!(name: "dt2")

    field1 = CustomFormTextField.create!(name: "Field1")

    field1.extra_data << dt1
    field1.extra_data << dt2

    assert_equal 2 , field1.extra_data.count
  end
end
