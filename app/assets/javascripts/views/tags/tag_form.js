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
    attrs.question_id = this.collection.question.id;
    var that = this;
    debugger;
    this.collection.fetch({data: {question_id: this.collection.question.id}});
    this.model.save(attrs, {
      success: function () {
        that.collection.add(that.model);
      }

    });
  }

});
