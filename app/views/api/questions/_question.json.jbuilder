json.extract! question, :id, :body, :title, :author_id
json.vote votes_hash[question.id]
