class CustomFormField < ActiveRecord::Base
  belongs_to :user
  has_many :extra_data
  accepts_nested_attributes_for :extra_data
  validates :user, presence: true

  after_create :check_old_entries

  def self.forms_type
    %w(CustomFormTextField CustomFormTextArea CustomFormComboBox)
  end

  def check_old_entries
    user.contacts.each do |contact|
      contact.custom_form_fields << self
    end
  end

end
