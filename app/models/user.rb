class User < ApplicationRecord
	has_many :reviews
	has_many :reviewed_recipes, through: :reviews, source: :recipe 
	has_many :recipes 

	validates :name, presence: true, length: { minimum: 2 }
	validates :email, presence: true, uniqueness: true
	has_secure_password

	def self.by_omniauth(auth)
		self.find_or_create_by(email: auth['info']['email']) do |u|
			u.name = auth['info']['name']
			u.password = SecureRandom.hex
		end							
	end
end
