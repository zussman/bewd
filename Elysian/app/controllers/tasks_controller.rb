class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
  end

  def _form
  end

  def show
  end
end
