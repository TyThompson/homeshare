class ListsController < ApplicationController
  before_action :set_list, except: [:create, :index]
  # def parsed_data
  #   incoming_data = request.body.read
  #   begin
  #     JSON.parse incoming_data
  #   rescue
  #     halt 400, "Request not JSON formatted"
  #   end
  # end

  # def index
  #   @home = Home.find_by(id: params[:home_id])
  #   @lists = @home.lists
  # end

  def show
    @list
  end

  def create
    @list = List.new(list_params)
      if @list.save
        render :show, status: 201
      else
        render :error
      end
  end

  def update
    if @list.update(list_params)
      render :show, status: 200
    else
      render :error
    end
  end

  def destroy
    authorize @list
    @list.destroy
  end



private
  def set_list
    begin
      @list = List.find_by(home_id: params[:home_id].to_i)
    rescue
      render 'not_found'
    end
  end

  def list_params
    params.require(:list).permit(:name, :home_id)
  end

end
