class HomesController < ApplicationController
  # before_action :check_login, except: [:show, :index, :search]
  # before_action :set_question, except: [:create, :index, :search]
  # before_action :check_user, only: [:update, :destroy]

  def create
    @home = Home.new(home_params)
    if @home.save
      render :show
    else
      render @home.errors
    end
  end

  def destroy
    @home.destroy
  end

  def update
    if @home.update(home_params)
      render :show
    else
      render @home.errors
    end
  end

  def index
    @homes = Home.where(:user_id)
  end

  def show

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
    params.permit(:user_id, :name, :rent, :city, :created_at)
  end
end
