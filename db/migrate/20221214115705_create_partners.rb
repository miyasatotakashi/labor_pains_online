class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.string :mother_id
      t.string :partners_id
      t.string :certification_code
      t.string :name

      t.timestamps
    end
  end
end
