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
    // this.listenTo(this.collection, "remove", this.removeQuestionSubview);
    debugger
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

  // removeQuestionSubview: function (question) {
  //   that = this;
  //   this.subviews('.answers-container').forEach(function(subview){
  //     if (subview.model === answer) {
  //       that.removeSubview('.answers-container', subview);
  //     }
  //   });
  // },
  // addTagsSubview: function (tag) {
  //   var subView = new Fora.Views.TagsIndexItem({model: tag});
  //   this.addSubview(".tags-container", subView);
  // },

  render: function () {
    var content = this.template({tag: this.model});
    this.$el.html(content);
    if (this.user_tags.any( {id: this.model.get('id') } )) {
      this.$el.find('.follow').hide();
      this.$el.find('.unfollow').show();
      // debugger
    } else {
      // debugger
      this.$el.find('.follow').show();
      this.$el.find('.unfollow').hide();
    }
    this.attachSubviews();
    // debugger
    return this;
  },

  follow: function (event) {
    event.preventDefault();
    // this.$el.find('.follow').hide();
    // this.$el.find('.unfollow').show();
    that = this;
    this.model.save({destroy: false}, {success: function () {
      that.user_tags.add(that.model, {merge: true});
      // Backbone.history.navigate("#tags/" + that.model.get('id'), {trigger: true});
      }
    });
  },

  unfollow: function (event) {
    event.preventDefault();
    that = this;
    this.model.save({destroy: true}, {success: function () {
      that.user_tags.remove(that.model);
      // Backbone.history.navigate("#tags/" + that.model.get('id'), {trigger: true});
    }});
  }
});
