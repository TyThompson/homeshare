class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @home = Home.find(params[:id])
    @users = @home.users.all
  end

end
