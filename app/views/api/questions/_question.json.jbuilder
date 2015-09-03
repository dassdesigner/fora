json.extract! question, :id, :body, :title, :author_id
json.date question.created_at.to_date.to_formatted_s(:short)
json.vote votes_hash[question.id]
json.num_upvotes question.votes.count
json.tag_id question.tags.first.id
json.tag_title question.tags.first.title
if answer
  json.answer_id answer.id
  json.answer_date answer.created_at.to_date.to_formatted_s(:short)
  json.answer_body answer.body
  json.answer_author answer.author.name
  # json.vote votes_hash[answer.id]
  # json.num_upvotes answer.votes.size
  json.answer_author answer.author.name
  json.state "Answer Written"
else
  json.state "Question Asked"
end
