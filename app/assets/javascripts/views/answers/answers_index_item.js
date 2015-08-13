Fora.Views.AnswersIndexItem = Backbone.View.extend({
  template: JST["answers/index_item"],
  
  tagName: "li",


  initialize: function () {
    this.listenTo(this.collection, "sync", this.render)
  },


  render: function () {
    var content = this.template({answer: this.model});
    this.$el.html(content);
    return this;
  },


});
