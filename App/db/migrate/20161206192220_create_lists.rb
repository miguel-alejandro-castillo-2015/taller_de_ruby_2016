class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :nombre ,null:false
      t.string :url ,null:false
      t.timestamps null:false
    end
  end
end
