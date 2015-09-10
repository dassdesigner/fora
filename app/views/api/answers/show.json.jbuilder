json.extract! @answer, :id, :body, :author_id
json.answer_author @answer.author.name
json.num_upvotes 0
json.answer_date @answer.created_at.to_date.to_formatted_s(:short)
json.answer_author @answer.author.name
json.answer_author_avatar @answer.author.img_src
