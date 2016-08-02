class HomesController < ApplicationController
  before_action :set_home, except: [:create, :index]
  # before_action :check_user, only: [:update, :destroy]
  # this controller is using params id as the home_id ex: /homes/:id(.:format)
  def create
    @home = Home.new(home_params)

    @home.creator_id = current_user.id
    if @home.save
      UserHome.create(user_id: current_user.id, home_id: @home.id)
      List.create(name: @home.name, user_id: current_user.id, home_id: @home.id)
      render :show, status: 201
    else
      render :error
    end
  end

  def destroy
    authorize @home
    @home.destroy
    render :action_successful, status: 200
  end


  def update
    if @home.update(home_params)
      render :show, status: 201
    else
      render :error
    end
  end


  def index
    @homes = Home.all
  end

  def show
  end

  def invite
    @friend = params[:friend_email]
    if user_in_home? && friend_exists?
      UserHome.create(user_id: @friend_object.id, home_id: @home.id)
      render :friend_joined_home, status: 200
    else
      render :sent_friend_invite, status: 200
    end
  end

  private

  def set_home
    begin
      @home = Home.find params[:home_id].to_i
    rescue
      # render json: "set_home method error"
    end
  end

  def home_params
    params.require(:home).permit(:name, :rent, :city, :created_at, :friend_email)
  end

  def user_in_home?
    begin
      UserHome.exists?(user_id: current_user.id, home_id: @home.id)
    rescue
      render json: "user_in_home method error"
    end
  end

  def friend_exists?
    begin
      if User.exists?(email: @friend)
        @friend_object = User.find_by(email: @friend)
        return true
      else
        UserNotifier.send_invite_email(@friend,@home.name).deliver
        return false
      end
    rescue
      render json: "friend_exists method error"
    end
  end

end
