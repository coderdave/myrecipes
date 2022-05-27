class LikesController < ApplicationController

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
    redirect_to recipes_path
  end

end
