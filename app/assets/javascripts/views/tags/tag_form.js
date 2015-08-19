Fora.Views.TagForm = Backbone.View.extend({
  template: JST["tags/form"],
  tagName: 'form',
  className: 'tag-form',
  events: {
    "click button" : "submit"
  },

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    var content = this.template({tag: this.model});
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    var that = this;
    this.collection.create(attrs, {success: function () {
      // that.collection.add(that.model, {merge: true});
      // Backbone.history.navigate("#questions/" + that.model.get('question_id'), {trigger: true});
      // that.model = new Fora.Models.Tag();
      }
    });
  }

});
