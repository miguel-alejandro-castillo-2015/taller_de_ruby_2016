require 'test_helper'

class TaskTempTest < ActiveSupport::TestCase
   test "creando una tarea temporal sin datos" do
  	  task=TaskTemp.new
  	  assert_not task.save,"guardando una tarea sin datos"
   end
    test "creando una tarea temporal con datos validos" do
  	  task=TaskTemp.new({descripcion:"una tarea temporal complicada",estado:"pendiente",prioridad:2,
               fecha_validez_inicio:Date.today,fecha_validez_fin:Date.today})
  	  assert task.save,"no se guardo la tarea temporal con datos validos"
   end
   
   test "verificar si es correcto el ordenamiento"


    end
    test "creando una tarea temporal con un rango de validez invertido"
        task=TaskTemp.new({descripcion:"una tarea temporal complicada con rangos de validez invertido",estado:"pendiente",prioridad:3,
               fecha_validez_inicio:Date.today,fecha_validez_fin:Date.today-1})
       assert task.save,"se guardo una tarea temporal con rango de validez invertido"
    end
    test "chequeando el pasaje de una tarea temporal a estado \"espirada\" "
        task=TaskTemp.new({descripcion:"una tarea temporal complicada con rangos de validez invertido",estado:"pendiente",prioridad:3,
               fecha_validez_inicio:Date.today-2,fecha_validez_fin:Date.today})
        task.save
        task.fecha_validez_fin=Date.today - 1
        task.save
        assert task.estado == "expirada","la  tarea temporal no cambio su estado a expirada"
    end
end
