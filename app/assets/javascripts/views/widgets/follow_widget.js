Fora.Views.FollowWidget = Backbone.View.extend({
  template: JST["widgets/follow_widget"],

  events: {
    "click .follow": "toggleFollow"
  },

  initialize: function () {
    this.listenTo(this.model, 'change:num_follows', this.render);
  },

  toggleFollow: function(event) {
    event.preventDefault();
    this.model.toggleFollow();
  },

  render: function() {
    var content = this.template({
      follow: this.model.follow(),
      model: this.model
    });
    this.$el.html(content);
    return this;
  }
});
