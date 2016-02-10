Fora.Views.MoreTagsIndexItem = Backbone.View.extend({
  template: JST["tags/more_tags_index_item"],
  tagName: "li",

  initialize: function(options) {
    this.listenTo(this.collection, "sync add", this.render);
    this.tagType = options.tagType;

  },

  render: function() {
    var content = this.template({
      tag: this.model
    });
    this.$el.html(content);
    return this;
  },


});
