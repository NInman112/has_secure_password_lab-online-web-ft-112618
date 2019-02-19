class UsersController < ApplicationController

  def create
    User.create(user_params)
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
