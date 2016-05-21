class Contact < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :contact, class_name: 'User', primary_key: 'id', foreign_key: 'contact_id'
end
