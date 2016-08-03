class ApiController < ApplicationController

 skip_before_action :authenticate_user!, only: [:register]

 before_action { request.format = :json }

  def register
    @user = User.create(
    email:        params[:email],
    password:     params[:password]
    )
    @token = @user.generate_token_for "Angular Frontend"
    render :successfully_registered, status: 200
  end

  def login
    @user = User.find_by email: params[:email]
    if @user.valid_password? params[:password]
      @token = @user.auth_tokens
      render :success_login, status: 200
    else
      render :fail_login, status: 403
    end
  end

end
