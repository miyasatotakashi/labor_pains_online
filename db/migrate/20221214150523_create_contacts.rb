class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :content
      t.string :mother_id
      t.string :partners_id
      t.string :certification_code, null: false

      t.timestamps
    end
  end
end
