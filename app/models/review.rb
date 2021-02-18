class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :title, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
  validates :content, presence: true
  validates :recipe, uniqueness: {scope: :user, message: ": This recipe has already been reviewed by you"}
	
  validate :is_title_case
	before_validation :make_title_case


  private

	def is_title_case
		if title.split.any?{|w|w[0].upcase != w[0]}
			errors.add(:title, "Title must be in title case")
		end
	end

	def make_title_case
		self.title = self.title.titlecase
	end

end
