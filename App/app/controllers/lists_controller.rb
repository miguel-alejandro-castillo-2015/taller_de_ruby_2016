class ListsController < ApplicationController
  before_action :set_list, only: [  :show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @tasks=@list.tasks.order(:prioridad)
  end

  # GET /lists/new
  def new
    @list = List.new
    if cookies[:list].blank?
      @lists=[]
    else
       cookies[:list][0]=""
       lasts=cookies[:list].split(',').last(5)
       @lists=List.find(lasts)
    end

  end

  # GET /lists/1/edit
  def edit
     @list.tasks.reload
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    respond_to do |format|
      if @list.save(list_params)
        if(cookies[:list].blank?)
           cookies[:list]=""
        end
        cookies[:list]=cookies[:list]+",#{@list.id}"
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)

        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      cookies[:list]=cookies[:list].gsub(",#{@list.id}","")
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find_by_url(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:nombre,:url)
    end
end
