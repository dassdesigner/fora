json.extract! @answer, :id, :body, :author_id
json.answer_author @answer.author.name
json.num_upvotes 0
