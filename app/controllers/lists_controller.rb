class ListsController < ApplicationController

  def parsed_data
    incoming_data = request.body.read
    begin
      JSON.parse incoming_data
    rescue
      halt 400, "Request not JSON formatted"
    end
  end


  def index
    @home = Home.find_by(params[:id])
    @lists = @home.lists
  end



  def show
  @list = List.where(id: params[:id], home_id: params[:home_id])
  end



  def new

  end


  def create
      @list = List.create(name: parsed_data["name"], item: parsed_data["item"],
              user_id: user.id, home_id: home.id)
      if @list.save
        render :show
      else
        render @list.errors
      end
  end




  def edit
  end

  def update
  end

  def destroy
    @home = Home.find_by(params[:id])
    @home.lists.find_by(name: parsed_data["name"]).delete
  end



private

  def approved_params
    params.require(:list).permit(:name, :item)
  end

end
