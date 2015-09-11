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
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def show
  end

  private
  def task_params
    params.require(:task).permit(:task, :task_category_id, task_categories_attributes: [:id, :name])
  end
end
