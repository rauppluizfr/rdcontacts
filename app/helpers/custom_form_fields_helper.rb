module CustomFormFieldsHelper
    def get_form_type_string type
      case type.to_s
      when "CustomFormTextField"
        "Text Field"
      when "CustomFormTextArea"
        "Text Area"
      when "CustomFormComboBox"
        "Combo Box"
      else
        "Not mapped yet"
      end
    end
end
