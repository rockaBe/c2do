class My::ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  # GET /lists
  # GET /lists.json
  def index
    @lists = current_user.lists
    @assigned_todos = current_user.assigned_todos.count
    @created_todos  = current_user.created_todos.count
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @todos = @list.todos
  end

  # GET /lists/new
  def new
    @list = current_user.lists.build
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
      
    respond_to do |format|
      if @list.save
        @subscription = @list.list_subscriptions.create(user_id: current_user.id)
        format.html { redirect_to [:my, @list], notice: 'List was successfully created.' }
        format.json { render action: 'show', status: :created, location: @list }
      else
        format.html { render action: 'new' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to [:my, @list], notice: 'List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to my_lists_url() }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @user = current_user
      @list = @user.lists.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :position)
    end
end
