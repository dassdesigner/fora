json.extract! question, :id, :body, :title, :author_id
json.vote votes_hash[question.id]
json.num_upvotes question.votes.count
json.tag_id question.tags.first.id
json.tag_title question.tags.first.title
json.top_answer question.top_answer
# if !question.answers.empty?
#   json.partial! "api/answers/answer", answer: question.answers.last, votes_hash: @votes_hash
#   json.state "Answer Written"
# else
#   json.state "Question Asked"
# end
