class Task < ApplicationRecord
   belongs_to :list, inverse_of: :tasks ,touch: true
   validates :descripcion, presence: true, length: { maximum: 255 }
   validates :estado, presence: true, inclusion: { in: [ "pendiente","hecha"],message: "%{value} is not a valid state"}
   validates :prioridad, numericality: {only_integer: true,greater_than_or_equal_to: 1,less_than_or_equal_to: 3}
   validates_associated :list
   
   def prioridad_to_s
   	   h={1=>"alta",2=>"media",3=>"baja"}
   	   h[prioridad]
   end
end
