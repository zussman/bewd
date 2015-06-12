class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.create project_params

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end


  private
  def project_params
    params.require(:project).permit(:name, :description, tasks_attributes: [:id, :name, :_destroy])
  end
end
