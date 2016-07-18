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
  @home = Home.find(params[:id])
  @lists = @home.lists.find_by(name: parsed_data["name"])
end



def show
   @home = Home.find(params[:id])
   @list = @home.lists.find_by(name: parsed_data["name"])
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
end




def edit
end

def update
end

def destroy
  @home = Home.find(params[:id])
  @home.lists.find_by(name: parsed_data["name"]).delete
end



end
