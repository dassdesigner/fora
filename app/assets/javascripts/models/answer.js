Fora.Models.Answer = Backbone.Model.extend(
  _.extend({}, Fora.Mixins.Voteable, {
      urlRoot: 'api/answers',

      voteableOptions: {
        foreignKeyType: "Answer"
      },

      parse: function(payload) {
        this.parseVote(payload);
        return payload;
      }
    })
);
