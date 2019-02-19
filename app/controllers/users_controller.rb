class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.name.nil? | user.name == ''
      redirect_to sessions_new_path
    else
      user.save
      binding.pry
      session[:user_id] = user.id
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
