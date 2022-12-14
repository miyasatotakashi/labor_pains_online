class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.string :user
      t.string :partners
      t.string :certification

      t.timestamps
    end
  end
end
