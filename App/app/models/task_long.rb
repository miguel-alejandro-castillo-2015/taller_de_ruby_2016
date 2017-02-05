class TaskLong < Task
	validates :estado, presence: true, inclusion: { in: [ "pendiente","hecha","en curso"],message: "%{value} is not a valid state"}
	validates :porcentaje_avance, numericality: {only_integer: true,greater_than_or_equal_to: 0,less_than_or_equal_to: 100}
	
end
