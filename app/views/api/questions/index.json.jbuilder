json.array!(@questions) do |question|
  json.partial! "api/questions/question", question: question, votes_hash: @votes_hash, answer: question.top_answer
end
