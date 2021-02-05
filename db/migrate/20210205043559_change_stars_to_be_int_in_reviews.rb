class ChangeStarsToBeIntInReviews < ActiveRecord::Migration[6.1]
  def change
  	change_column :reviews, :stars, :integer
  end
end
