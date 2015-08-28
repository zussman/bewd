class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create task_params
    if @task.save
      render action: 'index'
    else
      render action: 'new'
    end
  end

  def show
  end

  private
  def task_params
    params.require(:task).permit(:id, :task)
  end
end
