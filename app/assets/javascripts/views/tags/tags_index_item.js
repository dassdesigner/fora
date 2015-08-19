Fora.Views.TagsIndexItem = Backbone.View.extend({
  template: JST["tags/index_item"],
  tagName: "li",
  className: "index-item",

  initialize: function () {
    this.listenTo(this.collection, "sync add", this.render);
  },

  render: function () {
    var content = this.template({tag: this.model});
    this.$el.html(content);
    return this;
  }



});
