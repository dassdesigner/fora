Fora.Views.QuestionsIndexItem = Backbone.CompositeView.extend({
  template: JST["questions/index_item"],

  tagName: "li",
  className: "questions-index-item",

  events: {
    "click .answer-question": "answerQuestion",
  },


  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
    var answers = this.model.answers();
    var answersIndex = new Fora.Views.AnswersIndex({
      collection: this.model.answers()
    });
    this.addSubview('.question-footer', answersIndex);
    // var upvoteWidget = new Fora.Views.UpvoteWidget({
    //     model: this.model
    //   });
      // this.addSubview(".question-footer", upvoteWidget);
  },

  render: function() {
    var content = this.template({
      question: this.model,

    });
    this.$el.html(content);
    return this;
  },

  answerQuestion: function() {
    Backbone.history.navigate("#questions/" + this.model.get('id'), {
      trigger: true
    });
  },

  topAnswer: function () {
  }


});
