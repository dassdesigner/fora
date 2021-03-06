Fora.Views.SidebarFeed = Backbone.CompositeView.extend({
  template: JST["sidebars/feed"],

  initialize: function(params) {
    this.current_tag_id = params.tag_id;
    this.listenTo(this.collection, "sync change", this.render);
    this.listenTo(this.collection, "add", this.addTagSubview);
    this.listenTo(this.collection, "remove", this.removeTagSubview);
    var that = this;

  },


  addTagSubview: function(tag) {
    var subView = new Fora.Views.TagsIndexItem({
      model: tag,
      tagType: "user"
    });
    this.addSubview(".tags-container", subView);
  },

  removeTagSubview: function(tag) {
    //TODO: change to removemodelsubview
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
    $(".question-tag").find("[href='#tags/" + this.current_tag_id + "']").parent().css("background-color", "#CCC");
    // $(".question-index-item-tag").parent().css("background-color", "inherit");
    return this;

  }
});
