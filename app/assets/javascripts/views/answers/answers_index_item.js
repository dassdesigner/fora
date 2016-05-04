Fora.Views.AnswersIndexItem = Backbone.CompositeView.extend({
  template: JST["answers/index_item"],

  events: {
    "click .delete-answer" : "deleteAnswer",
    "click .edit-answer" : "editAnswer",
    "click .edit-answer-submit" : "saveAnswer"
  },

  tagName: "li",
  className: "answers-index-item",


  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    var upvoteWidget = new Fora.Views.UpvoteWidget({
      model: this.model
    });
    this.addSubview(".answer-footer", upvoteWidget);
  },


  render: function () {
    var content = this.template({answer: this.model});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  deleteAnswer: function (event) {
    this.model.destroy();
  },

  editAnswer: function(e) {
  $targetAnswer = $(e.currentTarget).closest('.answers-index-item');
  $targetAnswerBody = $targetAnswer.find('.answer-body');
  $targetAnswerBody.toggleClass('answer-editable');
  $targetAnswer.find('.edit-answer-submit').toggle();
  $targetAnswerBody.wysihtml5();
    // $targetAnswer.attr('contenteditable', 'true');
    // $targetAnswer.focus();
  },

  saveAnswer: function (e) {
    e.preventDefault();
    $(e.currentTarget).toggleClass('answer-editable');
    var formData = $(e.currentTarget).siblings('.answer-body')[0].innerHTML;
    this.model.save({body: formData});
  }
});
