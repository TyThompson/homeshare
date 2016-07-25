class ChoresController < ApplicationController
  # before_action :check_login, except: [:show, :index, :search]
  before_action :set_chore, except: [:create, :index, :completed_chores]
  # before_action :authenticate_user!
  # before_action :check_user, only: [:update, :destroy]


  def index
    @home = Home.find_by(params[:id])
    @chores = @home.chores.where(completed: false).all
  end


  def show
    @chore
  end


  def create
    @chore = Chore.new(chore_params)
    @chore.chore_creator_id = current_user.id
    @home = Home.find_by(creator_id: current_user.id)
    @chore.home_id = @home.id
    if @chore.save
      render :show
    else
      render :error
    end
  end


  def update
    if @chore.update(chore_params)
      render :show
    else
      render @chore.errors
    end
  end


  def mark_complete
    @chore.chore_completer_id = current_user.id
    @chore.completed = true
    @chore.completed_at = Time.now
    @chore.save 
    render :action_successful, status: 200
  end


  def completed_chores
    @home = Home.find_by(params[:id])
    @chores = @home.chores.where(completed: true).all
  end


  def destroy
    @chore.destroy
  end



  def upvote
    @chore.upvote_by current_user
    respond_to do |format|
      format.html {redirect_to :back}
      format.json {render json: {status: :ok, count: @chore.score}}
    end
  end


  def downvote
    @chore.downvote_by current_user
    respond_to do |format|
      format.html {redirect_to :back}
      format.json {render json: {status: :ok, count: @chore.score}}
    end
  end


  def votecount
    respond_to do |format|
      format.html {redirect_to :back}
      format.json {render json: {status: :ok, chore_votes: @chore.score}}
    end
  end




  private

  def set_chore
    begin
      @chore = Chore.find_by(id: params[:id], home_id: params[:home_id])
    rescue
      render 'not_found'
    end
  end

  def chore_params
    params.require(:chore).permit(:home_id, :name, :description, :bill_value,
    :chore_xp, :votes)
  end

end
