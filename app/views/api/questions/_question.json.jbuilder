json.extract! question, :id, :body, :title, :author_id

json.vote votes_hash[question.id]
json.num_upvotes question.votes.count
