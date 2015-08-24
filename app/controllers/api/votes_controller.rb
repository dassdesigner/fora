class Api::VotesController < ApplicationController

  def create
    @vote = current_user.votes.new(vote_params)
    if @vote.save
      render json: @vote
    else
      render json: @vote.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @vote = current_vote
    @vote.destroy
    render json: @vote
  end

  def update
    @vote = current_vote
    if @vote.update(vote_params)
      render :json => @vote
    else
      render :json => @vote.errors.full_messages
    end
  end
  private
    def current_vote
      @current_vote ||= Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:value, :voteable_id, :voteable_type)
    end

end
