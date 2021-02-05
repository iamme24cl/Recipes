class User < ApplicationRecord
	has_many :reviews
	has_many :reviewed_recipes, through: :reviews, source: :recipe 
	has_many :recipes 

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	has_secure_password
	
end
