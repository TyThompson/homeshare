class UsersController < ApplicationController
before_action :set_user, except: [:create, :new, :index]
  def show
    @homes = UserHome.where(user_id: params[:id])
    @total_exp = Chore.where(user_id: params[:id]).pluck(:value).sum
  end

  def index
    @homes = UserHome.where(user_id: params[:id])
    @users = Users.all
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    begin
      @user = User.find(params[:id])
    rescue
      render 'not_found'
    end
  end

end
