json.extract! task_temp, :id, :porcentaje_avance, :created_at, :updated_at
json.url task_temp_url(task_temp, format: :json)