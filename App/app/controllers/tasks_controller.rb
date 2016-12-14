class TasksController < ApplicationController
  before_action :set_list, only: [:show,:new_list_simple,:new_list_temp,:new_list_long , :edit,:edit_list_simple,:edit_list_temp,:edit_list_long ,:update, :destroy]
  before_action :set_task, only: [:destroy,:show,:edit,:update,:edit_list_simple,:edit_list_temp,:edit_list_long ]
  # GET /tasks
  # GET /tasks.json
  def index
    @list=List.find_by_url(params[:list_id])
    @tasks = @list.tasks.order(:prioridad)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
     
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  def new_list_simple
    @task = Task.new
  end
  def new_list_temp
     @task = Task.new
  end
  def new_list_long
     @task = Task.new
  end
  def edit_list_simple

  end
  def edit_list_temp
    
  end
  def edit_list_long
     
  end
  # GET /tasks/1/edit
  def edit
    #@list=List.find_by_url(params[:list_id])
    if(@task.type == "Task")
           render :edit_list_simple
           #format.json { render json: @task.errors, status: :unprocessable_entity }
        else
           if(@task.type == "TaskTemp")
             render :edit_list_temp
             #format.json { render json: @task.errors, status: :unprocessable_entity }
           else
              render :edit_list_long
              #format.json { render json: @task.errors, status: :unprocessable_entity }
           end
        end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
     
    respond_to do |format|
      list =List.find_by_url(params[:list_id])
     @task.list_id=list.id
      if @task.save
        format.html { redirect_to list, notice: 'Task was successfully created.' }
        format.json { render :list_path, status: :created, location: @task }
      else
        if(@task.type == "Task")
           format.html { render :new_list_simple }
           format.json { render json: @task.errors, status: :unprocessable_entity }
        else
           if(@task.type == "TaskTemp")
             format.html { render :new_list_temp}
             format.json { render json: @task.errors, status: :unprocessable_entity }
           else
              format.html { render :new_list_long}
              format.json { render json: @task.errors, status: :unprocessable_entity }
           end
        end
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
        list =List.find_by_url(params[:list_id])
      if @task.update(task_params)
        format.html { redirect_to @list, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
         if(@task.type == "Task")
           format.html { render :@list }
           format.json { render json: @task.errors, status: :unprocessable_entity }
        else
           if(@task.type == "TaskTemp")
             format.html { render :@list}
             format.json { render json: @task.errors, status: :unprocessable_entity }
           else
              format.html { render :edit_list_long}
              format.json { render json: @task.errors, status: :unprocessable_entity }
           end
        end
        
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to list_tasks_url, notice: 'Task was successfully destroyed.' }
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
      params.require(:task).permit( :descripcion, :estado, :prioridad , :fecha_inicio_validez, :fecha_fin_validez, :porcentaje_avance, :list_id, :type)
    end
end
