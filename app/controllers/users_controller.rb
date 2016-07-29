class UsersController < ApplicationController
before_action :set_user, except: [:create, :index]
before_action :set_homes, except: [:create, :index, :destroy]

  def show
    user_method
    @user_level = calc_exp(@user_exp)
    @user_percent = @percent
    @user_level = @level
    home_method
    @home_level = calc_exp(@home_exp)
    @home_percent = @percent
    @home_level = @level
  end

  def index
    @users = User.all
  end

  def destroy
    authorize @user
    @user.destroy
  end

  def update
    if @user.update(user_params)
      render :show, status: 201
    else
      render :error
    end
  end

  def me
    show
  end

  private

  def set_user
    begin
      @user = User.find(current_user.id)
    rescue
      render 'not_found'
    end
  end

  def set_homes
    begin
      @homes = UserHome.where(user_id: current_user.id)
    rescue
      render 'not_found'
    end
  end

  def home_method
    @home_exp = Chore.joins(:home).where(chore_completer_id: params[current_user.id]).pluck(:chore_xp).sum
  end

  def user_method
    @user_exp = Chore.where(chore_completer_id: params[current_user.id]).pluck(:chore_xp).sum
  end

  def calc_exp(input)
    exp = 200.0
    @level = 1
    until exp >= input
      @level += 1
      exp = exp * 2.0
    end
    @percent = (input/exp)*100
    if @percent == 100
      @percent = 0
    end
  end

  def user_params
    params.require(:user).permit(:email, :avatar, :venmo_username, :created_at)
  end

end
