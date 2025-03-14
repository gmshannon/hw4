class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id  # Log the user in
      redirect_to places_path, notice: "Account created successfully!"
    else
      render :new, status: :unprocessable_entity  # Re-render form with errors
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end