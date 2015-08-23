Fora.Views.QuestionsIndexItem = Backbone.View.extend({
  template: JST["questions/index_item"],

  tagName: "li",
  className: "index-item",

  events: {
    "click .answer-question" : "answerQuestion",
    "click .q-downvote" : "toggleDownvote"
  },


  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
    // this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var content = this.template({
        question: this.model, downvoteString: this.downvoteString()
        });
    this.$el.html(content);
    return this;
  },

  downvoteString: function () {
    return this.isDownvoted() ? "Downvoted" : "Downvote";
  },

  isDownvoted: function () {
    return !!this.model.get('current_user_vote');
  },
  answerQuestion: function () {
    Backbone.history.navigate("#questions/" + this.model.get('id'), {trigger: true});
  },

  toggleDownvote: function(event) {
    event.preventDefault();
    that = this;
    this.model.save({toggle_downvote: true});
  }




});
