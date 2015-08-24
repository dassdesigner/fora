json.answers_index do
  json.partial! 'api/answers/answers', answers_index: @question.answers
end
