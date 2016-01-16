class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :edit, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(get_params)
    if @project.save
      flash[:notice] = 'Project has bean created.'
      redirect_to @project
    else
      flash[:alert] = 'Project has not bean created.'
      render 'new'
    end
  end

  def update
    if @project.update(get_params)
      flash[:notice] = 'Project has been updated.'
      redirect_to @project
    else
      flash[:alert] = 'Project has not been updated'
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Project has been deleted'

    redirect_to projects_path
  end

  private
    def get_params
      params.require(:project).permit(:name, :description)
    end

    def set_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project that you looking for does'n exist"
      redirect_to projects_path
    end
end
