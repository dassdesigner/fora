Fora.Views.TagShow = Backbone.CompositeView.extend({
  template: JST["tags/show"],


  events: {
    "click button.follow": "follow",
    "click button.unfollow": "unfollow"
  },

  //TODO refactor (it's pretty identical to QuestionsIndex)
  initialize: function (options) {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addQuestionSubview);
    this.listenTo(this.model, "sync", this.render);
    this.user_tags = options.user_tags;
    this.user_tags.fetch();
    debugger
    var that = this;
    this.collection.each (function (question) {
      that.addQuestionSubview(question);
    });
  },


  addQuestionSubview: function (question) {
    var subView = new Fora.Views.QuestionsIndexItem({model: question});
    this.addSubview(".questions-container", subView);
  },

  render: function () {
    var content = this.template({tag: this.model});
    this.$el.html(content);
    if (this.user_tags.any( {id: this.model.get('id') } )) {
      this.$el.find('.follow').hide();
      this.$el.find('.unfollow').show();
    } else {
      this.$el.find('.follow').show();
      this.$el.find('.unfollow').hide();
    }
    this.attachSubviews();
    return this;
  },

  follow: function (event) {
    event.preventDefault();
    that = this;
    this.model.save({destroy: false}, {success: function () {
      that.user_tags.add(that.model, {merge: true});
      }
    });
  },

  unfollow: function (event) {
    event.preventDefault();
    that = this;
    this.model.save({destroy: true}, {success: function () {
      that.user_tags.remove(that.model);
    }});
  }
});
