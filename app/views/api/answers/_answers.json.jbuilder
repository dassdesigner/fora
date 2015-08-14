json.array! answers do |answer|
  json.extract! answer, :id, :body, :author_id
  json.answer_author User.find(answer.author_id).name
end
