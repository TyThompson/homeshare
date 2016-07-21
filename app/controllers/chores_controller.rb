class ChoresController < ApplicationController
  # before_action :check_login, except: [:show, :index, :search]
  before_action :set_chore, except: [:create, :index]
  # before_action :authenticate_user!
  # before_action :check_user, only: [:update, :destroy]


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
    @home = Home.find_by(params[:id])
    @chores = @home.chores
  end

  def show
    @chore
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
    params.require(:chore).permit(:home_id, :name, :description, :bill_value, :value, :votes)
  end

end
