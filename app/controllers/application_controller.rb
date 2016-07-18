class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    def check_user
      # render 'not_allowed' unless @question.user_id == params[:user_id]
    end
end
