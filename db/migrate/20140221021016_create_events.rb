class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_time
      t.boolean :open, :default => true
      t.integer :group_id

      t.timestamps
    end
  end
end
