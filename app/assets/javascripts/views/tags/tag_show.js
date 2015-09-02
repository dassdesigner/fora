Fora.Views.TagShow = Backbone.CompositeView.extend({
  template: JST["tags/show"],

  events: {
    "click button.follow": "toggleFollow"
  },

  //TODO refactor (it's pretty identical to QuestionsIndex)
  initialize: function (options) {
    this.userTags = options.user_tags;
    this.userTags.fetch();
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addQuestionSubview);
    this.listenTo(this.model, "sync change", this.render);
    this.listenTo(this.userTags, "sync", this.render);
    var followWidget = new Fora.Views.FollowWidget({
      model: this.model
    });
    this.addSubview('.tag-title', followWidget);
    var that = this;
    this.collection.each (function (question) {
      that.addQuestionSubview(question);
    });
  },


  addQuestionSubview: function (question) {
    var subView = new Fora.Views.QuestionsIndexItem({model: question});
    this.addSubview(".content-container", subView);
  },

  followString: function(){
    return this.isFollowed() ? "Unfollow" : "Follow";
  },
  isFollowed: function(){
    if (this.userTags.any( {id: this.model.get('id') } )) {
      return true;
    } else {
      return false;
    }
  },
  render: function () {
    var content = this.template({
      tag: this.model,
      followString: this.followString()
    });
    this.$el.html(content);

    this.attachSubviews();
    return this;
  },
  //TODO change destroy to follow
  toggleFollow: function(e){
    e.preventDefault();
    if(this.isFollowed()){
      this.unfollow();
    } else {
      this.follow();
    }
  },
  follow: function () {
    that = this;
    this.model.save({destroy: false}, {success: function () {
      that.userTags.add(that.model, {merge: true});
      }
    });
  },

  unfollow: function () {
    that = this;
    this.model.save({destroy: true}, {success: function () {
      that.userTags.remove(that.model);
    }});
  }
});
