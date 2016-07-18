class ChoresController < ApplicationController
  # before_action :check_login, except: [:show, :index, :search]
  # before_action :set_question, except: [:create, :index, :search]
  # before_action :check_user, only: [:update, :destroy]

  def thumbs_up
    @chore.thumbs_up+=1
    if @chore.save
      render :show
    else
      render @chore.errors
    end
  end

  def create
    @chore = Chore.new(chore_params)
    @chore.thumbs_up = 0
    if @chore.save
      render :show
    else
      render @chore.errors
    end
  end

  def new
    create
  end

  def destroy
    @chore.destroy
  end

  def update
    if @chore.update(chore_params)
      render :show
    else
      render @chore.errors
    end
  end

  def edit
    update
  end

  def index
    @chores = Chore.where(user_id: current_user.id)
  end

  def show
    @chore = Chore.where(id: params[:id], home_id: params[:home_id])
  end

  private

  def set_chore
    begin
      @chore = Chore.find(params[:id])
    rescue
      render 'not_found'
    end
  end

  def chore_params
    params.permit(:user_id, :home_id, :name, :description, :bill_value, :value, :votes)
  end

end
