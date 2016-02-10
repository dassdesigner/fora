Fora.Views.RightSidebarFeed = Backbone.CompositeView.extend({
  template: JST["right_sidebars/feed"],
  initialize: function(params) {
    this.listenTo(this.collection, "sync change", this.render);
    this.listenTo(this.collection, "add", this.addTagSubview);
    var that = this;
  },


  addTagSubview: function(tag) {
    var subView = new Fora.Views.TagsIndexItem({
      model: tag,
      tagType: "user"
    });
    this.addSubview(".more-tags-container", subView);
  },


  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;

  }
});
