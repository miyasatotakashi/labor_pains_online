class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.string :app_id
      t.string :acc_id
      t.string :certification_code, null: false
      t.timestamps
    end
  end
end
