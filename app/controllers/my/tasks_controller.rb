class My::TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_todo, only: [:index, :create, :new]
  # before_action :authenticate_user!

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = @todo.tasks.new
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
        format.html { redirect_to [:my, @task], notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to [:my, @task], notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to my_todo_tasks_url(@todo) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.includes(:todo).find(params[:id])
      @todo = @task.todo
    end

    def set_todo
      @todo = Todo.find(params[:todo_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params[:task][:todo_id] = params[:todo_id].present? ? params[:todo_id] : @todo.id.to_s
      params[:task][:creator_user_id] = current_user.id if current_user.present? && request.method.to_s == "POST"
      params.require(:task).permit(:name, :position, :due_at, :shared_state, :progress_state, :shared_state, :predue_at, :overdue_at, :todo_id, :creator_user_id)
    end
end
