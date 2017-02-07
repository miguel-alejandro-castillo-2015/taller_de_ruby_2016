require 'test_helper'

class TaskLongTest < ActiveSupport::TestCase
   test "creando una tarea larga sin datos" do
  	  task=TaskLong.new
  	  assert_not task.save,"guardando una tarea larga sin datos"
   end
    test "creando una tarea larga con datos validos" do
  	  task=TaskLong.new({descripcion:"una tarea larga complicada",estado:"en curso",prioridad:1,porcentaje_avance:22,type:"TaskLong"})
  	  assert task.save,"no se guardo una tarea larga con datos validos"
   end
   
   test "verificar si es correcto el ordenamiento" do


    end
    test "actualizacion de una tarea larga con porcentaje de avance dentro del rango permitido" do
       task=TaskLong.new({descripcion:"una tarea larga complicada",estado:"en curso",prioridad:1,porcentaje_avance:0,type:"TaskLong"})
       task.save
       task.porcentaje_avance=35
       assert task.save,"no se guardo una tarea larga con porcentaje de avance dentro del rango permitido"
    end

     test "actualizacion de una tarea larga con porcentaje de avance fuera del rango permitido" do
       task=TaskLong.new({descripcion:"una tarea larga complicada",estado:"en curso",prioridad:1,porcentaje_avance:0,type:"TaskLong"})
       task.save
       task.porcentaje_avance=-1
       assert task.save,"se guardo una tarea larga con porcentaje de avance fuera del rango permitido"
    end
end
