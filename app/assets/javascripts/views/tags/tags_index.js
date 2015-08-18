Fora.Views.TagsIndex = Backbone.CompositeView.extend({
  template: JST["tags/index"],
  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addTagSubview);
    this.listenTo(this.collection, "remove", this.removeTagSubview);

    //TODO refactor into add all subviews
    var that = this;
    this.collection.each (function (tag) {
      that.addTagSubview(tag);
    });

  },

  addTagSubview: function (tag) {
    var subview = new Fora.Views.TagsIndexItem({model: tag});
    this.addSubview('.tags-container', subView);
  },

  removeAnswerSubview: function (tag) {
    that = this;
    this.subviews('.tags-container').forEacch(function(subview){
      if (subvciew.model == answer) {
        that.removeSubview('.tags-container', subview);
      }
    });
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }

});
