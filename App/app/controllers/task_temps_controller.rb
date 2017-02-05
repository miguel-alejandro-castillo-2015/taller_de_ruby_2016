class TaskTempsController < ApplicationController
  before_action :set_task_temp, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:index,:new,:create,:show,:edit,:update]
  # GET /task_temps
  # GET /task_temps.json
  def index
    @task_temps = @list.tasks.where("type = ?","TaskTemp").order(:prioridad)
  end

  # GET /task_temps/1
  # GET /task_temps/1.json
  def show
  end

  # GET /task_temps/new
  def new
    @task_temp = TaskTemp.new
  end

  # GET /task_temps/1/edit
  def edit
  end

  # POST /task_temps
  # POST /task_temps.json
  def create
    @task_temp = TaskTemp.new(task_temp_params)
    respond_to do |format|
      if @task_temp.save
        format.html { redirect_to @list, notice: 'Task temp was successfully created.' }
        format.json { render :show, status: :created, location: @task_temp }
      else
        format.html { render :new }
        format.json { render json: @task_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_temps/1
  # PATCH/PUT /task_temps/1.json
  def update
    respond_to do |format|
      if @task_temp.update(task_temp_params)
        format.html { redirect_to [@list,@task_temp], notice: 'Task temp was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_temp }
      else
        format.html { render :edit }
        format.json { render json: @task_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_temps/1
  # DELETE /task_temps/1.json
  def destroy
    @task_temp.destroy
    respond_to do |format|
      format.html { redirect_to task_temps_url, notice: 'Task temp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_temp
      @task_temp = TaskTemp.find(params[:id])
    end

    def set_list
      @list=List.find_by_url(params[:list_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_temp_params
      params.require(:task_temp).permit(:descripcion,:estado,:prioridad,:fecha_inicio_validez, :fecha_fin_validez,:type,:list_id)
    end
end
