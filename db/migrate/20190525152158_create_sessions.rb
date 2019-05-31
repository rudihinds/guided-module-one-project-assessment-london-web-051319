class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :coach_id
      t.integer :fighter_id
    end
  end
end
