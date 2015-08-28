class Api::QuestionsController < ApplicationController

  def create
    @question = Question.new(question_params)
    @question.author_id = current_user.id
    if @question.save
      render :json => @question
    else
      render :json => @question.errors, :status => :unprocessable_entity
    end
  end

  def index
    if params[:query]
      @questions = (Question.topic_matches(params[:query]) + Question.title_matches(params[:query])).uniq
    else
      # maybe select for only topics current user is following?
      @questions = Question.includes(:answers, :tags).all
    end

    @votes_hash = current_user.question_votes_hash

    render :index
  end

  def show
    @question = Question.includes(:votes).find(params[:id])
    @votes_hash = {}
    @votes_hash[@question.id] = @question.votes.find_by(user_id: current_user.id)
    render :show
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render json: @question
  end

  def update
    # if params[:toggle_downvote]
    #   @question = Question.includes(:voters).find(params[:id])
    #   voter_ids = @question.voters.pluck(:id)
    #   # only downvoting allowed
    #   if voter_ids.include?(current_user.id)
    #     @question.update({voter_ids: voter_ids - [current_user.id]})
    #   else
    #     # @question.update({voter_ids: voter_ids + [current_user.id]})
    #     @question.votes.create({user_id: current_user.id, value: -1})
    #   end
    #
    #   render :json => @question
    #
    # else
      @question = Question.find(params[:id])
      if @question.update(question_params)
        render :json => @question
      else
        render :json => @question.errors.full_messages
      end
    # end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end


  def question_votes_hash
    zipped_votes = votes.where(voteable_type: "Question").pluck(:voteable_id).zip(votes)
    votes_hash = {}
    zipped_votes.each do |(id, vote)|
      votes_hash[id] = vote
    end

    votes_hash
  end
end
