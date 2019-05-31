class AddDateTimeToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :datetime, :datetime
  end
end
