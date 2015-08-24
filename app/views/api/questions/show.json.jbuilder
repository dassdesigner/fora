json.extract! @question, :id, :title, :body, :author_id
json.question_author User.find(@question.author_id).name
json.answer_count @question.answers.count
json.vote @votes_hash[@question.id]
json.num_upvotes @question.votes.size
json.answers do
  json.partial! 'api/answers/index', answers: @question.answers
end

json.tags @question.tags do |tag|
  json.extract! tag, :id, :title
end
