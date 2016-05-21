class CreateCustomFormFields < ActiveRecord::Migration
  def change
    create_table :custom_form_fields do |t|
      t.string :type
      t.string :name
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
