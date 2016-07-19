class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @home = Home.where(id: params[:home_id])
    @users = @home.first.users.all 
  end

end
