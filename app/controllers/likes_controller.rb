class LikesController < ApplicationController
  before_action :require_user

  def create
    @like = Like.new(recipe_id: params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])
    @like.chef = current_chef
    unless @like.save
      flash[:danger] = "Like can't be save at the moment."
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    unless current_chef.likes.find_by(recipe_id: params[:recipe_id]).destroy
      flash[:danger] = "Can't remove this like at the moment."
    end
  end

end
