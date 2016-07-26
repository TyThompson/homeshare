class UserHomesController < ApplicationController
before_action :set_user_home, except: [:create, :index]

  def show
    @userhome
  end

  def index
    @userhomes = UserHome.all
  end

  def create
    @userhome = UserHome.new(user_home_params)
    if @userhome.save
      render :show
    else
      render @userhome.errors
    end
  end

  def destroy
    @userhome.destroy
  end

  private

  def set_user_home
    begin
      @userhome = UserHome.find(params[:id])
    rescue
      render 'not_found'
    end
  end

  def user_home_params
    params.require(:user_homes).permit(:home_id)
  end

end
