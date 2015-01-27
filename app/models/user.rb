class User < ActiveRecord::Base
	has_many :posts
	has_many :votes
	has_many :comments
	enum role: [:editor, :admin]

	attr_accessor :password
	before_save :encrypt_password, :default_role

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end


	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def default_role
		self.role ||= :editor
	end
end
