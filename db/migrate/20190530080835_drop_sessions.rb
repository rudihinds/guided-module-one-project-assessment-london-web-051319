class DropSessions < ActiveRecord::Migration[5.2]
  def change
    drop_table :sessions
    create_table :sessions do |t|
      t.integer :coach_id
      t.integer :fighter_id
  end
end
end
