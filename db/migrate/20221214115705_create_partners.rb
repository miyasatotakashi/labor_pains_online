class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.string :mother_id, null: false
      t.string :father_id
      t.string :certification_code, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
