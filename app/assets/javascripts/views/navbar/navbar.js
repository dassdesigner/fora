Fora.Views.Navbar = Backbone.CompositeView.extend({
  template: JST["navbar/navbar"],
  events: {
    "submit": "search"
  },

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  search: function (event) {
    event.preventDefault();
    var query = $('#search').val().split(" ").join("+");
    Backbone.history.navigate("search?query="+ query, {trigger: true});
  }
});
