Fora.Views.AnswersIndexItem = Backbone.View.extend({
  template: JST["answers/index_item"],

  events: {
    "click button.delete-answer" : "deleteAnswer"
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
    event.preventDefault();
    var that = this;
    this.model.destroy({success: function () {
      that.collection.remove(that.model);
      Backbone.history.navigate("", {trigger: true});
    }});
  }
});
