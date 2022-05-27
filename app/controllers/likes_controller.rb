class LikesController < ApplicationController
  before_action :require_user

  def create
    @like = Like.new(recipe_id: params[:id])
    @recipe = Recipe.find(params[:id])
    @like.chef = current_chef
    if @like.save
      ActionCable.server.broadcast 'likes_channel', render(partial: 'likes/likes_counter', object: @recipe)
    end
  end

  def destroy
    current_chef.likes.find_by(recipe_id: params[:id]).destroy
    redirect_to recipes_path
  end

end
