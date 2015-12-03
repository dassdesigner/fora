Fora.Views.SidebarFeed = Backbone.CompositeView.extend({
  template: JST["sidebars/feed"],

  initialize: function (params) {
    this.current_tag_id = params.tag_id;
    this.listenTo(this.collection, "sync change", this.render);
    this.listenTo(this.collection, "add", this.addTagSubview);
    this.listenTo(this.collection, "remove", this.removeTagSubview);
    this.collection.each (function (question) {
      that.addTagsSubview(tag);
    });

    var tagForm = new Fora.Views.TagForm({
      collection: this.collection
    });
    // this.addSubview('.tag-form', tagForm);
    // var tag = new Fora.Models.Tag({});
    // var tagsIndex = new Fora.Views.TagsIndex({collection:  })
    // var tagForm = new Fora.Views.TagForm({model: tag, collection: });
    // this.addSubview('.tags-index', answersIndex);

  },


  addTagSubview: function (tag) {
    var subView = new Fora.Views.TagsIndexItem({model: tag});
    this.addSubview(".tags-container", subView);
  },

  removeTagSubview: function (tag) {
    //TODO: change to removemodelsubview
    that = this;
    this.subviews('.tags-container').forEach(function(subview){
      if (subview && subview.model === tag) {
        that.removeSubview('.tags-container', subview);
      }
    });
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    $("[href='#tags/" + this.current_tag_id + "']").css("background-color", "#CCC");
    return this;

  }
});
