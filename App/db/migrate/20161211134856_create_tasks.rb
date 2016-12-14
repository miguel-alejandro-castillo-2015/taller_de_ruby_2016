class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :descripcion, limit: 255
      t.string :estado
      t.decimal :prioridad
      t.date :fecha_inicio_validez
      t.date :fecha_fin_validez
      t.integer :porcentaje_avance
      t.references :list, foreign_key: true
      t.string :type
    end
  end
end

