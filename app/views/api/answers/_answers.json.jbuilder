json.array! answers do |answer|
  json.extract! answer, :id, :body, :author_id
  json.answer_author answer.author.name
end
