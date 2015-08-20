Fora.Views.TagShow = Backbone.CompositeView.extend({
  template: JST["tags/show"],


  events: {
    "click button.follow": "follow"
  },

  //TODO refactor (it's pretty identical to QuestionsIndex)
  initialize: function (options) {
    this.listenTo(this.collection, "add remove sync", this.render);
    this.listenTo(this.collection, "add", this.addQuestionSubview);
    this.listenTo(this.model, "sync", this.render);
    this.user_tags = options.user_tags;
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
    var content = this.template({tag: this.model});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  follow: function (event) {
    event.preventDefault();
    that = this;
    debugger;
    this.model.save({destroy: false}, {success: function () {
      that.user_tags.add(that.model, {merge: true});
      Backbone.history.navigate("#tags/" + that.model.get('id'), {trigger: true});
    }});
  }
});
