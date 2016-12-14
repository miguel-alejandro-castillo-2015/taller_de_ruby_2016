require_relative "task"
class TaskLong < Task
	 validates :fecha_inicio_validez, presence: true
	 validates :fecha_fin_validez, presence: true
end