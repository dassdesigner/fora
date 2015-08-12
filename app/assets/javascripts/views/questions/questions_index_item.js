Fora.Views.QuestionsIndexItem = Backbone.View.extend({
  template: JST["questions/index_item"],

  // tagName: li,


  initialize: function () {
    this.listenTo(this.collection, "sync", this.render)
  },


  render: function () {
    var content = this.template(question: model);
    this.$el.html(content);
    return this;
  },


});
