class CreateFavouriteRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :favourite_recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
