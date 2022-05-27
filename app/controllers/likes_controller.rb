class LikesController < ApplicationController
before_action :set_likes, only: [:show]


  def create
    @like = Like.new(recipe_id: params[:id])
    @like.chef = current_chef
    if @like.save
      flash[:success] = "like was created successfully"
      redirect_to recipes_path
    else
      flash[:danger] = "Sorry I dont like it"
    end
  end

  def destroy
    current_chef.likes.find_by(recipe_id: params[:id]).destroy
  end

  private

    def set_likes
      @likes = Like.all
    end

end
