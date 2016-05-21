class Contact < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :contact, class_name: 'User', primary_key: 'id', foreign_key: 'contact_id'

  has_many :contacts_custom_form_fields
  has_many :custom_form_fields, through: :contacts_custom_form_fields
end
