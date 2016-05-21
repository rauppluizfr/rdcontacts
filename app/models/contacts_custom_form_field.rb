class ContactsCustomFormField < ActiveRecord::Base
  belongs_to :contact
  belongs_to :custom_form_field
end
