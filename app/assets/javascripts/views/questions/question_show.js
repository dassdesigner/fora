Fora.Views.QuestionShow = Backbone.CompositeView.extend({
  template: JST["questions/show"],


  // addSubview: function (question) {
  //   var subView = new Fora.Views.QuestionsIndexItem({model: question});
  //   this.addSubview(".questions-container", subView);
  // },

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render)
  },


  render: function () {
    var content = this.template({question: this.model});
    this.$el.html(content);
    return this;
  },

});
