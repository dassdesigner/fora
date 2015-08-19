json.answers_count answers.count
json.answers_index do
  json.partial! 'api/answers/answers', answers_index: @question.answers
end
