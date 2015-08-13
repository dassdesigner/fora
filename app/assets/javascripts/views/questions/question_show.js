Fora.Views.QuestionShow = Backbone.CompositeView.extend({
  template: JST["questions/show"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);

    var answerView = new Fora.Views.AnswersIndex({collection: this.model.answers()});
    this.addSubview('.answers-index', answerView);
  },

  render: function () {
    var content = this.template({question: this.model});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },
});
