class UserHomesController < ApplicationController
before_action :set_user_home, except: [:create, :index]

# filter a home + user id
  def show
    @userhome
  end

# show list of users under that home
  def index
    @userhomes = UserHome.where(home_id: params[:home_id])
  end

# user joins a home
  def create
    @userhome = UserHome.new(user_home_params)
    if @userhome.save
      render :show
    else
      render @userhome.errors
    end
  end

# user leaves a home
  def destroy
    @userhome.destroy
  end

  private

  def set_user_home
    begin
      @userhome = UserHome.where(home_id: params[:home_id], user_id: current_user.id)
    rescue
      render 'not_found'
    end
  end

  def user_home_params
    params.require(:user_homes).permit(:home_id, :id)
  end

end
