Fora.Views.TagsIndex = Backbone.CompositeView.extend({
  template: JST["tags/index"],
  initialize: function(options) {
    this.listenTo(this.collection, "add", this.addTagSubview);
    this.listenTo(this.collection, "remove", this.removeTagSubview);
    this.tagType = options.tagType;
    //TODO refactor into add all subviews
    var that = this;
    if (options.questionId) {
      this.questionId = options.questionId;
    }
    this.collection.each(function(tag) {
      that.addTagSubview(tag);
    });
  },

  addTagSubview: function(tag) {
    var subview = new Fora.Views.TagsIndexItem({
      model: tag,
      tagType: this.tagType,
      questionId: this.questionId
    });
    this.addSubview('.tags-container', subview);
  },

  removeTagSubview: function(tag) {
    that = this;
    this.subviews('.tags-container').forEach(function(subview) {
      if (subview && subview.model === tag) {
        that.removeSubview('.tags-container', subview);
      }
    });
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }

});
