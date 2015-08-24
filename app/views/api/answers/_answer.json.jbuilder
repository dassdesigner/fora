json.extract! @answer, :id, :body, :author_id
json.answer_author @answer.author.name
json.vote votes_hash[@answer.id]
