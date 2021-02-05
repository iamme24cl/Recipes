class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :title, presence: true
  
end
