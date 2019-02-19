class UsersController < ApplicationController

  def create
    binding.pry
    user = User.new(user_params)
    if user.name.nil? | user.name == ''

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
