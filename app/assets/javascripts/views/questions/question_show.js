Fora.Views.QuestionShow = Backbone.CompositeView.extend({
  template: JST["questions/show"],
  events: {
    "click button.edit" : "editQuestion",
    "click button.delete" : "deleteQuestion"
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);

    //TODO REFACTOR
    var answer = new Fora.Models.Answer({question_id: this.model.get('id')});
    var answersIndex = new Fora.Views.AnswersIndex({collection: this.model.answers()});
    var answerForm = new Fora.Views.AnswerForm({model: answer, collection: this.model.answers()});
    this.addSubview('.answer-form', answerForm);
    this.addSubview('.answers-index', answersIndex);
  },

  render: function () {
    var content = this.template({question: this.model});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },


  deleteQuestion: function (event) {
    event.preventDefault();
    var that = this;
    this.model.destroy({
      success: function () {
        Backbone.history.navigate("", {trigger: true});
      }
    });
  },

  editQuestionBody: function () {
    var $question = $('.question-body');


  }


});
