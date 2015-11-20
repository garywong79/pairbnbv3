class SessionsController < ApplicationController
	before_action :authenticate_user!, only: []

	def new
		@user = User.new
	end

	def create
  
  	@user = User.find_by(email: params[:session][:email])
  	if @user && @user.authenticate(params[:session][:password])
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		redirect_to login_path, notice: "Invalid email or password"
  	end
  end

  def omniauth

    @user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to root_path, notice: "Facebook Sign in succesful"
  end


  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end


  
end
