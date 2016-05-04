Fora.Views.AnswersIndexItem = Backbone.CompositeView.extend({
  template: JST["answers/index_item"],

  events: {
    "click .delete-answer" : "deleteAnswer",
    "click .edit-answer" : "editAnswer",
    "blur .answer-body" : "saveAnswer"
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
    $(e.currentTarget).parent().parent().parent().parent().parent().find('.answer-body').wysihtml5();
    // $targetAnswer.attr('contenteditable', 'true');
    // $targetAnswer.focus();
  },

  saveAnswer: function (e) {
    e.preventDefault();
    var formData = e.currentTarget.innerHTML;
    this.model.save({body: formData});
  }
});
