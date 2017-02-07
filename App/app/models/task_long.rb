class TaskLong < Task
	validates :porcentaje_avance, numericality: {only_integer: true,greater_than_or_equal_to: 0,less_than_or_equal_to: 100}
	 private
	 def validate_estado
	 	if(!["pendiente","hecha","en curso"].include?(estado) )
          errors[:base] << msg_error_estado
        end
     end
end
