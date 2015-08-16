Fora.Views.QuestionsIndexItem = Backbone.View.extend({
  template: JST["questions/index_item"],

  tagName: "li",
  className: "index-item",

  events: {
    "click .answer-question" : "answerQuestion"
  },
  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template({question: this.model});
    this.$el.html(content);
    return this;
  },

  answerQuestion: function () {
    debugger
    Backbone.history.navigate("#questions/" + this.model.get('id'), {trigger: true});
  }
});
