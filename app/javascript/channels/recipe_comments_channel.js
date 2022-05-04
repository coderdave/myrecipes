import consumer from "./consumer";

consumer.subscriptions.create("RecipeCommentsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    $("#messages .comment-fix:first").prepend(data);
    $("#recipe_comment").val("");
  },
});
