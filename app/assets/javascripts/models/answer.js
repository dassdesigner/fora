Fora.Models.Answer = Backbone.Model.extend(
  _.extend({}, Fora.Mixins.Voteable, {
      urlRoot: 'api/answers',

      voteableOptions: {
        foreignKey: "answer_id"
      },

      parse: function(payload) {
        this.parseVote(payload);
        return payload;
      }
    })
);
