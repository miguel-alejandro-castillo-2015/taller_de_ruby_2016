class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :nombre
      t.string :url
      t.timestamps null:false
    end
  end
end