Fora.Views.DownvoteWidget = Backbone.View.extend({
  template: JST["widgets/downvote_widget"],

  events: {
    "click": "toggleDownvote"
  },

  initialize: function () {
    this.listenTo(this.model, 'change:num_upvotes', this.render);
  },

  toggleDownvote: function(event) {
    event.preventDefault();
    this.model.toggleDownvote();
  },

  render: function() {
    var content = this.template({
      vote: this.model.vote(),
      model: this.model
    });
    this.$el.html(content);
    return this;

  }
});
