class ApiController < ApplicationController

 skip_before_action :authenticate_user!, only: [:register]

 before_action { request.format = :json }

 def register
   # FIXME: need a way to log in an existing user (meaning what exactly?)
   @user = User.create!(
     email:    params[:email],
     password: params[:password]
   )
   @token = @user.generate_token_for "Angular Frontend"
   render :successfully_registered, status: 200
 end

 def me
   @user = current_user
  #  @birthday = Facebook.new(@user).get_birthday
 end

end
