class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.name.nil? | user.name == ''
      binding.pry
      redirect_to sessions_new_path
    else
      user.save

      session[:user_id] = user.id
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
