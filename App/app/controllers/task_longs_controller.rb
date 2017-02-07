class TaskLongsController < ApplicationController
  before_action :set_task_long, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:index,:new,:create,:show,:edit,:update]
  # GET /task_longs
  # GET /task_longs.json
  def index
    @tasks = @list.tasks.where("type = ?","TaskLong").order(:prioridad)
  end

  # GET /task_longs/1
  # GET /task_longs/1.json
  def show
  end

  # GET /task_longs/new
  def new
    @task = TaskLong.new
  end

  # GET /task_longs/1/edit
  def edit
  end

  # POST /task_longs
  # POST /task_longs.json
  def create
    @task = TaskLong.new(task_long_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @list, notice: 'Task long was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_longs/1
  # PATCH/PUT /task_longs/1.json
  def update
    respond_to do |format|
      if @task.update(task_long_params)
        format.html { redirect_to [@list,@task], notice: 'Task long was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_longs/1
  # DELETE /task_longs/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to task_longs_url, notice: 'Task long was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_long
      @task = TaskLong.find(params[:id])
    end
    def set_list
       @list=List.find_by_url(params[:list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_long_params
      params.require(:task_long).permit(:estado,:descripcion,:prioridad,:porcentaje_avance,:type,:list_id)
    end
end
