Fora.Views.QuestionsIndexItem = Backbone.CompositeView.extend({
  template: JST["questions/index_item"],

  tagName: "li",
  className: "questions-index-item",

  events: {
    "click .answer-question": "answerQuestion",
  },


  initialize: function() {
    var upvoteWidget = new Fora.Views.UpvoteWidget({
      model: this.model
    });

    this.addSubview(".question-footer", upvoteWidget);
    this.listenTo(this.model, "sync", this.render);

  },

  render: function() {
    var content = this.template({
      question: this.model,
    });
    this.$el.html(content);
    return this;
  },

  // downvoteString: function() {
  //   return this.isDownvoted() ? "Downvoted" : "Downvote";
  // },
  //
  // isDownvoted: function() {
  //   return this.model.get('is_downvoted');
  // },
  answerQuestion: function() {
    Backbone.history.navigate("#questions/" + this.model.get('id'), {
      trigger: true
    });
  },


});
