class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id, :references => "users"
      t.integer :contact_id, :references => "users"

      t.timestamps null: false
    end
  end
end
