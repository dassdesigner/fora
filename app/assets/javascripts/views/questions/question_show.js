Reddit.Views.LinkShow = Backbone.CompositeView.extend({
  template: JST["questions/show"],

  
  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
  },

  render: function () {
    var content = this.template({question: this.model});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }


});
