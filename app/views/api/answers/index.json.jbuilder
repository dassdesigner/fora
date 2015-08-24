json.array!(@question.answers) do |answer|
  json.partial! "api/answers/answer", answer: answer, votes_hash: votes_hash
end
