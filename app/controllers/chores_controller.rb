class ChoresController < ApplicationController
  # before_action :check_login, except: [:show, :index, :search]
  before_action :set_chore, except: [:create, :index, :completed_chores]
  # before_action :authenticate_user!
  # before_action :check_user, only: [:update, :destroy]


  def index
    set_home
    @chores = @home.chores.where(completed: false)
  end


  def all_chores
    set_home
    @chores = @home.chores.all
  end


  def show
    @chore
  end


  def create
    @chore = Chore.new(chore_params)
    @chore.chore_creator_id = current_user.id
    set_home
    @chore.home_id = @home.id
    if @chore.save
      render :show, status: 201
    else
      render :error
    end
  end


  def update
    if @chore.update(chore_params)
      render :show, status: 200
    else
      render :error
    end
  end


  def mark_complete
    @chore.chore_completer_id = current_user.id
    @chore.completed = true
    @chore.completed_at = Time.now.strftime("%A, %B %e, %Y %l:%M %P %Z")
    if @chore.save
      render :show, status: 200
    else
      render :error
    end
  end


  def completed_chores
    set_home
    @chores = @home.chores.where(completed: true).all
  end


  def destroy
    authorize @chore
    @chore.destroy
  end




  private

  def set_chore
    begin
      @chore = Chore.find_by(id: params[:id], home_id: params[:home_id])
    rescue
      render :not_found
    end
  end

  def set_home
    begin
      @home = Home.find params[:home_id].to_i
    rescue
      render :not_found
    end
  end

  def chore_params
    params.require(:chore).permit(:home_id, :name, :description, :chore_xp, :votes)
  end

end
