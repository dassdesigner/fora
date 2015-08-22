json.array!(@questions) do |question|
  json.extract! question, :id, :title, :body, :author_id
  json.vote_status question.votes.find_by({user_id: current_user.id})
  json.user do
    json.name question.user.name
  end
end
