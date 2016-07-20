class HomesController < ApplicationController
  before_action :set_home, except: [:create, :index, :show]
  before_action :authenticate_user!
  # before_action :check_user, only: [:update, :destroy]

  def create
    @home = Home.new(home_params)
    @home.creator_id = current_user.id
    if @home.save
      UserHome.create!(user: current_user,
        home: @home)
      render :show, status: 201
    else
      render :error
    end
  end

  def destroy
    @home.destroy
    render :action_successful, status: 200
  end

  def update
    if @home.update(home_params)
      binding.pry
      render :show, status: 201
    else
      render :error
    end
  end

  def index
    @homes = Home.all
  end

  def show
    @home
  end

  private

  def set_home
    begin
      @home = Home.find(params[:id])
    rescue
      render 'not_found'
    end
  end

  def home_params
    params.require(:home).permit(:name, :rent, :city, :created_at)
  end
end
