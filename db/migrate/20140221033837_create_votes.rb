class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :place_id
      t.integer :event_id

      t.timestamps
    end
  end
end
