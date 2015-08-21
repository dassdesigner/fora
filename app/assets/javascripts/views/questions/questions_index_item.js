Fora.Views.QuestionsIndexItem = Backbone.View.extend({
  template: JST["questions/index_item"],

  tagName: "li",
  className: "index-item",

  events: {
    "click .answer-question" : "answerQuestion",
    "click .toggle-upvote" : "toggleUpvote",
    "click .toggle-downvote" : "toggleDownvote"
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
    Backbone.history.navigate("#questions/" + this.model.get('id'), {trigger: true});
  },

  toggleUpvote: function (event) {
    event.preventDefault();
    that = this;
    this.model.save({value: 1}, {success: function () {
      // modify upvoter collection
      }
    });
  },

  toggleDownvote: function(event) {
    event.preventDefault();
    that = this;
    this.model.save({value: -1}, {success: function () {
      // modify upvoter collection if applicable
      }
    });
  }




});
