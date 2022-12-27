class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :hospital, :string
    add_column :users, :baby_name, :string
    add_column :users, :scheduled_date, :string
  end
end
