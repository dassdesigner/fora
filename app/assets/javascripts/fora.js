window.Fora = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    Fora.Routers.Router()
    }
    Backbone.history.start()
  }
};

$(document).ready(function(){
  Fora.initialize();
});
