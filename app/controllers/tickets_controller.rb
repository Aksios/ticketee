class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_params, only: [:create, :update]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(set_params)
    if @ticket.save
      flash[:notice] = 'Ticket has been created.'
      redirect_to [@project, @ticket]
    else
      flash[:alert] = 'Ticket has not been created.'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @ticket.update(set_params)
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render 'edit'
    end
  end


private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_params
    params.require(:ticket).permit(:title, :description)
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end
end
