class ListsController < ApplicationController
  before_action :set_list, except: [:create, :new, :index]
  # def parsed_data
  #   incoming_data = request.body.read
  #   begin
  #     JSON.parse incoming_data
  #   rescue
  #     halt 400, "Request not JSON formatted"
  #   end
  # end

  def index
    @home = Home.find_by(params[:home_id])
    @lists = @home.lists
  end

  def show
    @list
  end

  def new
    create
  end

  def create
    @list = List.new(list_params)
      if @list.save
        render :show
      else
        render @list.errors
      end
  end

  def edit
    update
  end

  def update
    if @list.update(list_params)
      render :show
    else
      render @list.errors
    end
  end

  def destroy
    @list = List.where(id: params[:id], home_id: params[:home_id])
    @list.destroy
  end

private
  def set_list
    begin
      @list = List.where(id: params[:id], home_id: params[:home_id])
    rescue
      render 'not_found'
    end
  end

  def list_params
    params.require(:list).permit(:name, :item, :user_id, :home_id)
  end

end
