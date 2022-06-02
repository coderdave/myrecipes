class LikesController < ApplicationController
  before_action :require_user

  def create
    @like = Like.new(recipe_id: params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])
    @like.chef = current_chef
    @like.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    current_chef.likes.find_by(recipe_id: params[:recipe_id]).destroy
  end

end
