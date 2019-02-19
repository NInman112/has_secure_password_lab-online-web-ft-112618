class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.name.nil? | user.name == ''
      redirect_to users_new_path
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
