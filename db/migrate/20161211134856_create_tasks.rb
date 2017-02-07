class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :descripcion, limit: 255 ,null:false
      t.string :estado,null:false
      t.integer :prioridad,null:false
      t.date :fecha_inicio_validez
      t.date :fecha_fin_validez
      t.integer :porcentaje_avance
      t.references :list, foreign_key: true ,null:false
      t.string :type,null:false
    end
  end
end

