class AddTimeSlotToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :time_slot, :integer
  end
end
