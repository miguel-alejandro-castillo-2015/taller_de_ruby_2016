class TaskTemp < Task
	 validates :estado, presence: true, inclusion: { in: [ "pendiente","hecha","expirada"],message: "%{value} is not a valid state"}
	 validates :fecha_inicio_validez, presence: true
	 validates :fecha_fin_validez, presence: true
	 validate  :validate_fechas
	 after_find  do  |task_temp|
        if(  Date.today > task_temp.fecha_fin_validez )
            task_temp.estado="expirada"
            task_temp.save
        end

	 end
	 private
	 def validate_fechas
		if(fecha_inicio_validez > fecha_fin_validez)
           errors[:base] << "error de fechas"
		end
	 end
end