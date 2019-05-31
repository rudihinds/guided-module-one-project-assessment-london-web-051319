class DropFighters < ActiveRecord::Migration[5.2]
  def change
    drop_table :fighters
    create_table :fighters do |t|
      t.string :name
  end
end
end
