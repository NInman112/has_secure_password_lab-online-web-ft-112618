class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    binding.pry
    if user.valid?
      redirect_to sessions_new_path
    else
      user.save
      session[:user_id] = user.id
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
