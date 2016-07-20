class HomesController < ApplicationController
  # before_action :check_login, except: [:show, :index, :search]
  before_action :set_home, except: [:create, :new, :index]
  # before_action :check_user, only: [:update, :destroy]
  before_action :authenticate_user!

  def new
    @home = Home.new
    @home.user_id = current_user.id
  end

  def create
    @home = Home.new(home_params)
    @home.creator_id = current_user.id
    if @home.save
      UserHome.create!(user: current_user,
        home: @home)
      render :show
    else
      render :error
    end
  end

  def destroy
    @home.destroy
  end

  def edit
    update
  end

  def update
    if @home.update(home_params)
      render :show
    else
      render @home.errors
    end
  end

  def index
    @homes = @home.all
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
