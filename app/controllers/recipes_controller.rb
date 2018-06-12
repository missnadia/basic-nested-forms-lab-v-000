class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(recipe_params)
    @recipe.ingredients.build(recipe_params)
  end

  def create
    @recipe = Recipe.create(recipe_params)
      redirect_to recipe_path(@recipe)
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :id,
        :name,
        :quantity
      ]
    )
  end
end
