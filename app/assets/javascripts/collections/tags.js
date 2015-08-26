Fora.Collections.Tags = Backbone.Collection.extend({
  url: function(){
      return "/api/tags";
  },
  model: Fora.Models.Tag,

  initialize: function (models, options) {
    if (options && options.question) { this.question = options.question; }
  },

  getOrFetch: function (id) {
    var tag = this.get(id);
    var that = this;

    if (!tag) {
      tag = new Fora.Models.Tag({id: id});
      tag.fetch({
        success: function(){
          that.add(tag);
        }
      });
    } else {
      tag.fetch();
    }
    return tag;
  }

});
