class Task < ApplicationRecord
   belongs_to :list, inverse_of: :tasks
   validates :descripcion, presence: true, length: { maximum: 255 }
   validates :estado, presence: true, inclusion: { in: [ "pendiente","hecha","expirada","en curso"],message: "%{value} is not a valid state"}
   validates :prioridad, numericality: {only_integer: true,greater_than_or_equal_to: 1,less_than_or_equal_to: 3}
  
   
 
end
