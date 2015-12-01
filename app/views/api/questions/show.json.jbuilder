json.extract! @question, :id, :title, :body, :author_id
json.question_author User.find(@question.author_id).name
# json.answer_count @question.answers.count
json.vote @votes_hash[@question.id]
json.num_upvotes @question.votes.size
json.tags @question.tags do |tag|
  json.extract! tag, :id, :title
end

json.more_questions Question.all.sample(3) do |more_question|
  json.extract! more_question, :title, :id, :answers
  top_answer = more_question.answers.first
  if top_answer
    json.extract! top_answer.author, :img_src, :name
    json.body top_answer.body
  end
  # debugger;

end
# debugger
