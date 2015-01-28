class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: [:show, :update, :destroy]

  # GET users/1/tasks
  # GET users/1/tasks.json
  def index
    @tasks = @user.tasks

    render json: @tasks
  end

  # GET users/1/tasks/1
  # GET users/1/tasks/1.json
  def show
    render json: @task
  end

  # POST users/1/tasks
  # POST users/1/tasks.json
  def create
    @task = @user.tasks.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT users/1/tasks/1
  # PATCH/PUT users/1/tasks/1.json
  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      render json: @task
      # head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE users/1/tasks/1
  # DELETE users/1/tasks/1.json
  def destroy
    @task.destroy

    head :no_content
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_task
      @task = @user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :due_date, :user_id)
    end
end
