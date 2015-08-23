class RemoveVotesFromQuestionsAndAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :votes
    remove_column :questions, :votes
  end
end
