module ApplicationHelper

	def current_user
		if session[:user_id]
			@current_user ||=User.find_by_id(session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end
	
	def avatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		if user.image
			user.image
		else
		# uploader = AvatarUploader.new
		
		user.avatar.thumb
		end
	end
	
end
