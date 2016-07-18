class ListsController < ApplicationController

def index
  @home = Home.find(params[:home_id])
  @lists = @home.lists.all
end

def show
  @list = List.find(params[:id])
end

def new
end

def create
end

def edit
end

def update
end

def destroy
end



end
