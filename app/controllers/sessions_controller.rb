class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    redirect_to users_path unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id

  end
end
