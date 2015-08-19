Fora.Views.SidebarFeed = Backbone.CompositeView.extend({
  template: JST["sidebars/feed"],

  initialize: function () {
    this.listenTo(this.collection, "sync change", this.render);
    this.listenTo(this.collection, "add", this.addTagsSubview);
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


  addTagsSubview: function (tag) {
    var subView = new Fora.Views.TagsIndexItem({model: tag});
    this.addSubview(".tags-container", subView);
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});
