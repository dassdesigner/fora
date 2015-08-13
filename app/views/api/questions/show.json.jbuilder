json.extract! @question, :id, :title, :body, :author_id
json.answers do
  json.partial! 'api/answers/answers', answers: @question.answers
end
