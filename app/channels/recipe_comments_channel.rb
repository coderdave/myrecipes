class RecipeCommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "recipe_comments_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
