class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    # @recipes = Recipe.paginate(page: params[:page], per_page: 5)
  end
end
