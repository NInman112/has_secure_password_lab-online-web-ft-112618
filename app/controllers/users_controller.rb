class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
    else
      redirect_to sessions_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
