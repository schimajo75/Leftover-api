class Api::V1::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all 
    render json: @recipes, status: 200
  end

  def show
    @recipe = Recipe.find(params[:id])

    render json: @recipe, status: 200
  end

  def create
    @recipe = Recipe.create(recipe_params)

    render json: @recipe, status: 200
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(note_params)
    render json: @recipe, status: 200
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete

    render json: {recipeId: @recipe.id}
  end

  private
    def recipe_params
      params.require(:recipe).permit(:ingredients)
    end
end
