Fora.Views.QuestionsIndex = Backbone.CompositeView.extend({
  template: JST["questions/index"],


  initialize: function () {
    this.listenTo(this.collection, "add remove sync", this.render);
    this.listenTo(this.collection, "add", this.addQuestionSubview);
    var that = this;
    this.collection.each (function (question) {
      that.addQuestionSubview(question);
    });
  },

  addQuestionSubview: function (question) {
    var subView = new Fora.Views.QuestionsIndexItem({model: question});
    this.addSubview(".questions-container", subView);
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});
