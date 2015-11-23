class User < ActiveRecord::Base
  # attr_accessible :avatar_cache
	validates :name, presence: true
	validates :password_digest, presence:true
	validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/ }


	before_save :downcase_email

  has_many :lists, dependent: :destroy
  has_many :reservations, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
	has_secure_password
  # searchkick
	
	
  def self.from_omniauth(auth)
    user = User.find_or_initialize_by(email: auth.info.email)
    if user.new_record?
      user.name = auth.extra.raw_info.name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
   		user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.password = SecureRandom.hex
      user.save
    	else
    		# return user
      user.update(provider: auth.provider, uid: auth.uid) if ((user.uid==nil)||(user.provider==nil))
    	end
    	user
  end

  def booking_total_price
    total_price = 200
    total_price
  end

  def has_payment_info?
    braintree_customer_id
  end

	private
		def downcase_email
			self.email = self.email.downcase
		end
end
