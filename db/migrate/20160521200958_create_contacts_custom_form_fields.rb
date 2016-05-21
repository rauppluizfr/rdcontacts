class CreateContactsCustomFormFields < ActiveRecord::Migration
  def change
    create_table :contacts_custom_form_fields do |t|
      t.belongs_to :contact
      t.belongs_to :custom_form_field
      t.text :value

      t.timestamps null: false
    end
  end
end
