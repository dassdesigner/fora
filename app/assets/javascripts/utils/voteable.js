// TODO: 1.) refactor! using ternaries and an additional option maybe? for now it's
// so I can have clarity :^)
// 2.) destroy the opposite type of vote if it exists
Fora.Mixins.Voteable = {
  vote: function () {
    if (!this._vote) {
      this._vote = new Fora.Models.Vote();
    }
    return this._vote;
  },
  createUpvote: function () {

    this.vote().set({
      "voteable_id": this.id,
      "voteable_type": this.voteableOptions.foreignKeyType,
      "value": 1});

    this.vote().save({}, {
      success: function () {
        this.updateUpvoteCount(1);
      }.bind(this)
    });
  },

  // createDownvote: function () {
  //   this.vote().clear();
  //   this.vote().set({
  //     "voteable_id": this.id,
  //     "voteable_type": this.voteableOptions.foreignKeyType,
  //     "value": -1});
  //
  //   this.vote().save({}, {
  //     success: function () {
  //     }.bind(this)
  //   });
  // },


  destroyUpvote: function () {
    this.vote().destroy({
      success: function(model) {
        model.unset("id");
        this.updateUpvoteCount(-1);
      }.bind(this)
    });
  },

  // destroyDownvote: function () {
  //   this.vote().destroy({
  //     success: function(model) {
  //       model.unset("id");
  //     }.bind(this)
  //   });
  // },

  toggleUpvote: function () {

    if (this.vote().isNew()) {
      this.createUpvote();
    } else {
      this.destroyUpvote();
    }
  },
  //
  // toggleDownvote: function () {
  //   if (this.vote().isNew()) {
  //     this.createDownvote();
  //   } else {
  //     this.destroyDownvote();
  //   }
  // },
  updateUpvoteCount: function (delta) {
    this.set("num_upvotes", this.get("num_upvotes") + delta);
  },
  // TODO REFACTOR

  parseVote: function (payload) {
    if (payload.vote) {
      this.vote().set(payload.vote);
      delete payload.vote;
    }
  }
};
