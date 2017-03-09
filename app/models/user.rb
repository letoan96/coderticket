class User < ApplicationRecord
	has_secure_password
	#validates :email, presence: true, uniqueness: true

	def to_s
		name
	end

	def self.from_omniauth(auth)
		email = auth[:info][:email] || "#{auth[:uid]}@facebook.com"
		user = where(email: email).first_or_initialize
		user[:name]= email
		user[:password_digest] ='abc123'
		user.save && user
	end

end
