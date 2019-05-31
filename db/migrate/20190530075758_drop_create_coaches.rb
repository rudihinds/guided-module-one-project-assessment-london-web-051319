class DropCreateCoaches < ActiveRecord::Migration[5.2]
  def change
    drop_table :create_coaches
    create_table :Coaches do |t|
      t.string :name
      t.string :style
  end
end
end
