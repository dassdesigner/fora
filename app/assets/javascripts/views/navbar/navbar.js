Fora.Views.Navbar = Backbone.CompositeView.extend({
  template: JST["navbar/navbar"],
  events: {
    "submit": "search",
    "click .sign-out": "signOut",
    "click .submit" : "submit"
  },

  initialize: function () {
    // this.listenTo(this.collection, "sync", this.render);
    this.model =  new Fora.Models.Question();
    this.collection = new Fora.Collections.Questions();
    this.collection.fetch();
  },

  render: function () {
    var content = this.template({question: this.model});
    this.$el.html(content);
    return this;
  },

  search: function (event) {
    event.preventDefault();
    var query = $('#search').val().split(" ").join("+");
    Backbone.history.navigate("search?query="+ query, {trigger: true});
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = this.$el.find('.question-form').serializeJSON();
    var that = this;
    this.model.set(attrs);
    this.model.save({}, {success: function () {
      that.collection.add(that.model, {merge: true});
      Backbone.history.navigate("#questions/" + that.model.get('id'), {trigger: true});
      }
    });
  }
});
