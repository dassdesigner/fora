Fora.Views.QuestionsIndexItem = Backbone.View.extend({
  template: JST["questions/index_item"],

  tagName: "li",


  initialize: function () {
    this.listenTo(this.collection, "sync", this.render)
  },


  render: function () {
    debugger;
    var content = this.template({question: this.model});
    this.$el.html(content);
    return this;
  },


});
