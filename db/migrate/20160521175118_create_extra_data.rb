class CreateExtraData < ActiveRecord::Migration
  def change
    create_table :extra_data do |t|
      t.string :name
      t.belongs_to :custom_form_field

      t.timestamps null: false
    end
  end
end
