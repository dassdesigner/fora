json.extract! @question, :id, :title, :body, :author_id
  author_name = User.find(@question.author_id).name
  json.author_name author_name
