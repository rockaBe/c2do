class My::TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:index, :new, :create]
  # before_action :authenticate_user!

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)
    puts " >>>>>>>>>>>>>>>>> Todo.count (before): #{Todo.count}"
    respond_to do |format|
      if @todo.save
        format.html { redirect_to [:my, @todo], notice: 'Todo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @todo }
      else
        format.html { render action: 'new' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
    puts " >>>>>>>>>>>>>>>>> Todo.count (after): #{Todo.count}"
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to [:my, @todo], notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @list = @todo.list
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to my_list_todos_url(@list) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.includes(:list).find(params[:id])
      @list = @todo.list
    end

    # Use callbacks to set parent for not shallowed routes.
    def set_list
      @list = List.find(params[:list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      if request.method.to_s == "POST"
        params[:todo][:list_id] = params[:list_id].present? ? params[:list_id] : @list.try(:id).to_s
        params[:todo][:creator_user_id] = current_user.id if current_user.present?
      end
      params.require(:todo).permit(:name, :position, :list_id, :creator_user_id, :assigned_user_id, :due_at, :predue_at, :overdue_at, :shared_state, :progress_state)
    end
end
