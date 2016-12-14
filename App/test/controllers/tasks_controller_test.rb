require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { descripcion: @task.descripcion, estado: @task.estado, fecha_fin_validez_date: @task.fecha_fin_validez_date, fecha_inicio_validez: @task.fecha_inicio_validez, list_id: @task.list_id, porcentaje_avance: @task.porcentaje_avance, prioridad: @task.prioridad, type: @task.type } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { descripcion: @task.descripcion, estado: @task.estado, fecha_fin_validez_date: @task.fecha_fin_validez_date, fecha_inicio_validez: @task.fecha_inicio_validez, list_id: @task.list_id, porcentaje_avance: @task.porcentaje_avance, prioridad: @task.prioridad, type: @task.type } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
