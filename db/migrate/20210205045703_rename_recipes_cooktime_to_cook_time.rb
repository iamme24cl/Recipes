class RenameRecipesCooktimeToCookTime < ActiveRecord::Migration[6.1]
  def change
  	rename_column :recipes, :cooktime, :cook_time
  end
end
