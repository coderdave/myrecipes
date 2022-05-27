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
    $("#messages").prepend(data);
    $("#recipe_comment").val("");

    if ($("#messages .comment-fix").length == 1) {
      $('h3.comments_title').empty()
      $('h3.comments_title').text('Prior Comments:')
    }
  },
});
