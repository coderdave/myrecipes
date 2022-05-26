class LikesController < ApplicationController
before_action :set_recipe, only: [:show, ]

  def show
  end

  def create
    @like = Like.new(like: true, recipe_id: recipe_params)
    @like.chef = current_chef
    if @like.save
      flash[:success] = "like was created successfully"
      redirect_to recipes_path
    else
      flash[:danger] = "Sorry I dont like it"
    end
  end

  def update

  end

  private
    def set_likes
      @likes = Like.all
    end

    def recipe_params
      params.require(:recipe).permit(:id)
    end
end
