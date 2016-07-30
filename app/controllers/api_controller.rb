class ApiController < ApplicationController

 skip_before_action :authenticate_user!, only: [:register, :test]

 before_action { request.format = :json }

  def register
    @user = User.create(
    email:        params[:email],
    password:     params[:password]
    )
    @token = @user.generate_token_for "Angular Frontend"
    render :successfully_registered, status: 200
  end

  def invitethem
    UserNotifier.send_invite_email.deliver
    render :successfully_invite, status: 200
  end

end
