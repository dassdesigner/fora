Fora.Views.QuestionsIndex = Backbone.CompositeView.extend({
  template: JST["questions/index"],


  initialize: function () {
    this.listenTo(this.collection, "add remove sync", this.render);
    this.listenTo(this.collection, "add", this.addQuestionSubview);
    this.listenTo(this.tags, "sync", this.render);

    var that = this;
    this.collection.each (function (question) {
      that.addQuestionSubview(question);
    });

    // this.tags.each (function (question) {
    //   that.add
    // })
  },

  addQuestionSubview: function (question) {
    var subView = new Fora.Views.QuestionsIndexItem({model: question});
    this.addSubview(".questions-container", subView);
  },

  // addTagsSubview: function (tag) {
  //   var subView = new Fora.Views.TagsIndexItem({model: tag});
  //   this.addSubview(".tags-container", subView);
  // },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});
