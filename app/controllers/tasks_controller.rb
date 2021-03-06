class TasksController < ApplicationController
  before_action :set_list, only: [:index,:show,:create,:new, :edit,:update, :destroy]
  before_action :set_task, only: [:destroy,:show,:edit,:update ]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @list.tasks.where("type = ?","Task").order(:prioridad)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
     
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

 
     
  
  # GET /tasks/1/edit
  def edit
    
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @list, notice: 'Task  was successfully created.' }
        format.json { render :list_path, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end

    
    
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to [@list,@task], notice: 'Task temp was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_temp }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end

   
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @list, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end
    def set_list
      @list=List.find_by_url(params[:list_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit( :descripcion, :estado, :prioridad , :list_id, :type)
    end
end
