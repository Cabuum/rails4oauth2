class User < ActiveRecord::Base
	validates_presence_of :email, :password

	has_secure_password

	has_many :tasks

	def self.authenticate(email, password)
		user = find_by(email: email)
		if user.present?
			user.authenticate password
		end
	end
end
