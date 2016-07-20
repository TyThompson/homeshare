class ApplicationController < ActionController::Base

  before_action :set_format

  def set_format
    request.format = :json
  end

  def check_user
    # render 'not_allowed' unless @question.user_id == params[:user_id]
  end

  def emailer
    # contact = Watchlist.where("price < ?", @pet.price).where(species: @pet.species)
      contact.each do |p|
        UserNotifier.send_email(p.user).deliver
      end
  end
end
