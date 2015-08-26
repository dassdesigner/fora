Fora.Views.QuestionShow = Backbone.CompositeView.extend({
  template: JST["questions/show"],
  events: {
    "click .edit": "editQuestionBody",
    "click .delete": "deleteQuestion",
    "blur .question-body": "saveQuestionBody",
  },

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
    //TODO REFACTOR
    // this.model.fetch();
    var answer = new Fora.Models.Answer({
      question_id: this.model.get('id')
    });
    var answersIndex = new Fora.Views.AnswersIndex({
      collection: this.model.answers()
    });
    var answerForm = new Fora.Views.AnswerForm({
      model: answer,
      collection: this.model.answers()
    });
    var upvoteWidget = new Fora.Views.UpvoteWidget({
      model: this.model
    });
    this.addSubview('.question-footer', upvoteWidget);
    this.addSubview('.answer-form', answerForm);
    this.addSubview('.answers-index', answersIndex);
  },

  render: function() {
    var content = this.template({
      question: this.model
    });
    this.$el.html(content);
    this.attachSubviews();
    this.delegateEvents(this.events);
    return this;
  },


  deleteQuestion: function(event) {
    event.preventDefault();
    var that = this;
    this.model.destroy({
      success: function() {
        Backbone.history.navigate("", {
          trigger: true
        });
      }
    });
  },

  editQuestionBody: function() {
    $('.question-body').attr('contenteditable', 'true');
    $('.question-body').focus();
  },

  saveQuestionBody: function(e) {
    e.preventDefault();
    var formData = $(e.currentTarget).text();
    this.model.save({
      body: formData
    });
  },

});
