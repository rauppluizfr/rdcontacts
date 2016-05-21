class CustomFormField < ActiveRecord::Base
  belongs_to :user
  has_many :extra_data
  accepts_nested_attributes_for :extra_data

  def self.forms_type
    %w(CustomFormTextField CustomFormTextArea CustomFormComboBox)
  end

end
