class LikesController < ApplicationController
  before_action :require_user

  def create
    @like = Like.new(recipe_id: params[:id])
    @recipe = Recipe.find(params[:id])
    @like.chef = current_chef
    if @like.save
      render json: @recipe
    end
  end

  def destroy
    current_chef.likes.find_by(recipe_id: params[:id]).destroy
    redirect_to recipes_path
  end

end
