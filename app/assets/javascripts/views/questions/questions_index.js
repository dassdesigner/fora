Fora.Views.QuestionsIndex = Backbone.CompositeView.extend({
  template: JST["questions/index"],

  // tagName: li,


  initialize: function () {
    this.listenTo(this.collection, "add remove sync", this.render)
    this.listenTo(this.collection, "add", this.addQuestionSubview)
    this.collection.each (function (question) {
      this.addQuestionSubview(question);
    });
  },


  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addQuestionSubview: function (question) {
    var subView = Fora.Views.QuestionIndexItem({model: question});
    this.addSubview(".questions-container", subView);
  }
});
