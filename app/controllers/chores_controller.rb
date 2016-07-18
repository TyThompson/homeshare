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
    @chore.created_at Time.now
    if @chore.save
      render :show
    else
      render @chore.errors
    end
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

  def index
    @chores = Chore.order('created_at DESC')
  end

  def show

  end

  private

  def set_chores
    begin
      @chore = Chore.find(params[:id])
    rescue
      render 'not_found'
    end
  end

  def chore_params
    params.permit(:user_id, :home_id, :description)
  end

  def check_user
    # render 'not_allowed' unless @question.user_id == params[:user_id]
  end

end
