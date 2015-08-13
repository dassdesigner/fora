window.Fora = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Fora.Routers.Router()
    Backbone.history.start()
  }
};
