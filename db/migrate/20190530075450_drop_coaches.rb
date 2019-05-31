class DropCoaches < ActiveRecord::Migration[5.2]
  def change
    drop_table :coaches
    create_table :create_coaches do |t|
      t.string :name
      t.string :style
  end
end
end
