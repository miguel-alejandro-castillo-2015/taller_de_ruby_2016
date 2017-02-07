class TaskTemp < Task
	 validates :fecha_inicio_validez, presence: true
	 validates :fecha_fin_validez, presence: true
	 validate  :validate_fechas
	 after_create :check_state
	 after_find  do  |task_temp|
        if(  Date.today > task_temp.fecha_fin_validez )
            task_temp.estado="expirada"
            task_temp.save
           
        end

	 end
	 private
	 def validate_fechas
		if((fecha_inicio_validez.blank? || fecha_inicio_validez.blank?)||(fecha_inicio_validez > fecha_fin_validez))
           errors[:base] << msg_error_fechas
		end
	 end
	 def validate_estado
	 	if(!["pendiente","hecha","expirada"].include?(estado) )
          errors[:base] << msg_error_estado
        end
     end
     def msg_error_fechas
       "error de fechas"
     end
     def check_state
         if(fecha_fin_validez < Date.today)
             estado="expirada"
             save
             reload
		 end
     end
end