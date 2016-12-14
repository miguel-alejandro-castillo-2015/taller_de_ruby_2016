require_relative "task"
class TaskTemp < Task
	validates :porcentaje_avance, numericality: {only_integer: true,greater_than_or_equal_to: 0,less_than_or_equal_to: 100}
end