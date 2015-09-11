class TaskCategoriesController < ApplicationController
  def index
    @task_categories = TaskCategory.all
  end

  def show
    @task_category = TaskCategory.find(params[:id])
  end

  def new
    @task_category = TaskCategory.new
  end

  def create
    @task_category = TaskCategory.create task_category_params
    if @task_category.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @task_category = TaskCategory.find params[:id]
    @task_category.destroy
    redirect_to task_categories_path
  end

  private
  def task_category_params
    params.require(:task_category).permit(:id, :name)
  end
end
