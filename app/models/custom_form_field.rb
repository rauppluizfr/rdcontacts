class CustomFormField < ActiveRecord::Base
  belongs_to :user

  def self.forms_type
    %w(CustomFormTextField CustomFormTextArea CustomFormComboBox)
  end

end
