class UsersController < ApplicationController
before_action :set_user, except: [:create, :index]
before_action :set_homes, except: [:create, :index, :destroy]

  def show
    @total_exp = Chore.where(chore_completer_id: params[:id]).pluck(:chore_xp).sum
    user_exp = @total_exp
    exp = 100.0
    @level = 0
    until exp > user_exp
      @level += 1
      exp = exp * 2.0
    end
    @percent = (user_exp/exp)
  end

  def index
    @users = User.all
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

  def set_homes
    begin
      @homes = UserHome.where(user_id: params[:id])
    rescue
      render 'not_found'
    end
  end

end
