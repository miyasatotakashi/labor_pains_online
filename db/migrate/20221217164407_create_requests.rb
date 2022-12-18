class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :mother_id
      t.string :father_id
      t.string :certification_code, null: false
      t.timestamps
    end
  end
end
