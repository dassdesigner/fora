Fora.Views.TagShow = Backbone.CompositeView.extend({
  template: JST["tags/show"],

  //TODO refactor (it's pretty identical to QuestionsIndex)
  initialize: function (options) {
    this.listenTo(this.collection, "add", this.addQuestionSubview);
    this.listenTo(this.model, "sync", this.render);
    var followWidget = new Fora.Views.FollowWidget({
      model: this.model
    });
    this.addSubview('.action-bar', followWidget);
    var that = this;
    this.collection.each (function (question) {
      that.addQuestionSubview(question);
    });
  },


  addQuestionSubview: function (question) {
    var subView = new Fora.Views.QuestionsIndexItem({model: question});
    this.addSubview(".content-container", subView);
  },

  render: function () {
    var content = this.template({
      tag: this.model,
    });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

});
