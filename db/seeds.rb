# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  lista0=List.create({nombre: 'Lista 0'})
  task1=Task.create({descripcion:"una tarea 1",estado:"pendiente",prioridad:1,type:"Task",list_id:lista0.id})
  task2=Task.create({descripcion:"una tarea 2",estado:"pendiente",prioridad:2,type:"Task",list_id:lista0.id})
  task3=TaskTemp.create({descripcion:"una tarea 3",estado:"pendiente",prioridad:2,
               fecha_inicio_validez:Date.today,fecha_fin_validez:Date.today,type:"TaskTemp",list_id:lista0.id})
  task4=TaskTemp.create({descripcion:"una tarea 4",estado:"pendiente",prioridad:3,
               fecha_inicio_validez:Date.today,fecha_fin_validez:Date.today,type:"TaskTemp",list_id:lista0.id})
  task5=TaskLong.create({descripcion:"una tarea 5",estado:"en curso",prioridad:1,porcentaje_avance:13,type:"TaskLong",list_id:lista0.id})
  task6=TaskLong.create({descripcion:"una tarea 6",estado:"en curso",prioridad:2,porcentaje_avance:34,type:"TaskLong",list_id:lista0.id})
  