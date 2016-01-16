class ProjectsController < ApplicationController
  def index
    #@projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
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


  private
    def get_params
      params.require(:project).permit(:name, :description)
    end
end
