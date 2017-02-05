require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "creando una lista sin nombre" do
  	  lista=List.new({nombre:""})
  	  assert_not lista.save,"guardando una lista sin nombre"
   end
   test "respetando unicidad de url de lista" do
   	   lista_a=List.new({nombre:" a a"});
   	   lista_b=List.new({nombre:"a a "});
   	   lista_c=List.new({nombre:" a a "});
   	   lista_d=List.new({nombre:"a a"});
   	   lista_a.save
   	   lista_b.save
   	   lista_c.save
   	   assert lista_d.save,["la url agregada no respeta unicidad"]
   	end
   	test "conflicto de unicidad de url" do
   	   lista_a=List.new({nombre:"a b c"})
   	   lista_b=List.new({nombre:"a b c"});
   	   lista_a.save
   	   assert_not lista_b.save,"no se respeta la unicidad"  
   	 end
end
