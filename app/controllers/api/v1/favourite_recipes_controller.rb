class Api::V1::FavouriteRecipesController < Api::V1::BaseController
  def index
    # user = @current_user.id
    user = User.last
    @favorite_recipes = user.recipes
    render json: @favorite_recipes, each_serializer: RecipeSerializer
  end

  def create
    recipe = Recipe.find(params[:id])
    # user = @current_user.id
    user = User.last
    user.recipes << recipe
    render json: { message: "Recipe added to favorites" }
  end

  def cancel
    recipe = Recipe.find(params[:id])
    # user = @current_user.id
    user = User.last
    user.recipes.delete(recipe)
    render json: { message: "Recipe removed from favorites" }
  end
end