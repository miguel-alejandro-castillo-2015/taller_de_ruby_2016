require 'test_helper'

class TaskTest < ActiveSupport::TestCase
   test "creando una tarea sin datos" do
  	  task=Task.new
  	  assert_not task.save,"guardando una tarea sin datos"
   end
    test "creando una tarea con datos validos" do
  	  task=Task.new({descripcion:"una tarea complicada",estado:"pendiente",prioridad:1})
  	  assert task.save,"no se guardo una tarea con datos validos"
   end
   
   test "verificar si es correcto el ordenamiento"


    end

end
