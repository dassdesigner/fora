Fora.Views.QuestionsIndexItem = Backbone.CompositeView.extend({
  template: JST["questions/index_item"],

  tagName: "li",
  className: "questions-index-item",

  events: {
    "click .answer-question": "answerQuestion",
  },


  initialize: function() {
    this.listenTo(this.model, "sync", this.render);

    var topAnswerId = this.model.get('top_answer');
    if (topAnswerId) {
      var topAnswer = new Fora.Models.Answer({id: topAnswerId});
      topAnswer.fetch();
      // var topAnswer = this.model.answers().getOrFetch(topAnswerId);
      var answer = new Fora.Views.AnswersIndexItem({
        model: topAnswer
      });
      this.addSubview(".answer", answer, true);
    } else {
    var upvoteWidget = new Fora.Views.UpvoteWidget({
      model: this.model
    });

    this.addSubview(".question-footer", upvoteWidget);
    }
  },

  render: function() {
    var content = this.template({
      question: this.model,
    });
    this.$el.html(content);
    this.attachSubviews();
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
