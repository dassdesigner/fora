json.answer_count @answers.count
json.array! @answers do |answer|
  json.partial! "api/answers/answer", answer: answer, votes_hash: @votes_hash
end
