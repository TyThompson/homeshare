class TokensController < ApplicationController
  protect_from_forgery with: :exception


  def index
    @tokens = current_user.auth_tokens
  end

  def destroy
    current_user.auth_tokens.find(params[:id]).expire!
    redirect_back fallback_location: tokens_path
  end

end
