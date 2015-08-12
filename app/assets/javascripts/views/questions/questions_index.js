Fora.Views.LinksIndex = Backbone.View.extend({
  template: JST["questions/index"],

  initialize: function () {
    this.listenTo(this.collection, "add remove change", this.render)
  },

  render: function () {
    var content = this.template({questions: this.collection});
    this.$el.html(content);
    return this;
  }
});
