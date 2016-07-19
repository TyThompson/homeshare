class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
