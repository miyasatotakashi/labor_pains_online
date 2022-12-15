class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.string :mother_id, null: false
      t.string :partners_id, null: false
      t.string :certification_code, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
