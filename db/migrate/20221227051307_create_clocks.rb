class CreateClocks < ActiveRecord::Migration[6.1]
  def change
    create_table :clocks do |t|
      t.time :start_time

      t.timestamps
    end
  end
end
