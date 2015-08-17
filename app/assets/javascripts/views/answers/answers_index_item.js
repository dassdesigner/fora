Fora.Views.AnswersIndexItem = Backbone.View.extend({
  template: JST["answers/index_item"],

  events: {
    "click button.delete-answer" : "deleteAnswer",
    "click button.edit-answer" : "editAnswer",
    "blur .answer-body" : "saveAnswer"
  },

  tagName: "li",
  className: "index-item",


  initialize: function () {
    this.listenTo(this.collection, "sync add", this.render);
  },


  render: function () {
    var content = this.template({answer: this.model});
    this.$el.html(content);
    return this;
  },

  deleteAnswer: function (event) {
    this.model.destroy();
  },

  editAnswer: function() {
    $('.answer-body').attr('contenteditable', 'true');
    $('.question-body').focus();
  },

  saveAnswer: function (e) {
    e.preventDefault();
    var formData = $(e.currentTarget).text();
    this.model.save({body: formData});
  }
});
