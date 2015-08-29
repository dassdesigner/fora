class Api::AnswersController < ApplicationController

  def create
    @answer = current_question.answers.new(answer_params)
    @answer.author_id = current_user.id
    if @answer.save
      render :show
    else
      render :json => @answer.errors, :status => :unprocessable_entity
    end
  end

  def index
    @question ||= current_question
    @answers = @question.answers.includes(:votes)
    @votes_hash = current_user.votes_hash("Answer")
    render :_index1
  end

  def show
    @answer = Answer.includes(:votes).find(params[:id])
    @votes_hash = {}
    @votes_hash[@answer.id] = @answer.votes.find_by(user_id: current_user.id)
    render :show
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    render json: @answer
  end

  def update
    # if params[:value]
    #   @answer = Answer.includes(:votes).find(params[:id])
    #   @votes_hash ||= {}
    #   @votes_hash[@answer.id] = @answer.votes.find_by(user_id: current_user.id)
    #   current_user_vote = @answer.votes.find_by({user_id: current_user.id})
    #   if params[:value] == current_user_vote.value
    #     @answer.update({voter_ids: voter_ids - [current_user.id]})
    #   else
    #     @answer.update({voter_ids: voter_ids + [current_user.id]})
    #     current_user_vote.value = params[:value]
    #   end
    # else
      @answer = Answer.find(params[:id])
      if @answer.update(answer_params)
        render :json => @answer
      else
        render :json => @answer.errors.full_messages
      end
    # end
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end

  def current_question
     Question.find(params[:question_id]) || Question.find(params[:answer][:question_id])
  end
end
