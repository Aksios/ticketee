class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    if User.create(user_params)
      flash[:notice] = "You have signed up successfully."
      redirect_to projects_path
    else
      #flash[:alert] = "You are not signin up"
      render 'new'
    end
  end

  def show
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
