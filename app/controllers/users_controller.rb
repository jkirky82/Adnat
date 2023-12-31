class UsersController < ApplicationController
  skip_before_action :require_login
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "User not created"
      render :new, status: :unprocessable_entity
    end
  end


  private 

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :organisation_id)
  end
end
