require 'test_helper'

class TaskTest < ActiveSupport::TestCase
   test "creando una tarea sin datos" do
      list=List.new({nombre:"listado"})
      list.save
  	  task=Task.new({list_id:list.id})
  	  assert_not task.save,"guardando una tarea sin datos"
   end
    test "creando una tarea con datos validos" do
      list=List.new({nombre:"listado"})
      list.save
  	  task=Task.new({descripcion:"una tarea complicada",estado:"pendiente",prioridad:1,type:"Task",list_id:list.id})#,created_at:DateTime.now,updated_at:DateTime.now})
  	  assert task.save,"no se guardo una tarea con datos validos"
   end
   
   
end
