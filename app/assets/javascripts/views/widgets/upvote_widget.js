Fora.Views.UpvoteWidget = Backbone.View.extend({
  template: JST["widgets/upvote_widget"],

  events: {
    "click .upvote": "toggleUpvote"
  },

  initialize: function () {
    this.listenTo(this.model, 'change:num_upvotes', this.render);
    this.listenTo(this.model, 'sync', this.render);
  },

  toggleUpvote: function(event) {
    event.preventDefault();
    $('span').popover('hide');
    this.model.toggleUpvote();
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
