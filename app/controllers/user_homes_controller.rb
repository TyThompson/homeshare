class UserHomesController < ApplicationController

  def index
    @userhomes = UserHome.all
  end

end
