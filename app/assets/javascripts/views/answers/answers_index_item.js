Fora.Views.AnswersIndexItem = Backbone.View.extend({
  template: JST["answers/index_item"],

  tagName: "li",
  className: "index-item",


  initialize: function () {
    this.listenTo(this.collection, "sync add", this.render);
  },


  render: function () {
    var content = this.template({answer: this.model});
    this.$el.html(content);
    return this;
  },


});
