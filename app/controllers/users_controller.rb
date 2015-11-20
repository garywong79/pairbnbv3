class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:new, :create]
	attr_accessor :avatar, :avatar_cache

	def new
		@user = User.new
	end

	def create
		# uploader = AvatarUploader.new
		# uploader.store!(params[:user][:avatar])
		# uploader.thumb.url

		@user = User.new(user_params)
		if @user.save
			redirect_to login_path
		else
			render :new
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
	end

end
