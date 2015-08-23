json.array!(@questions) do |question|
  json.extract! question, :id, :title, :body, :author_id
  json.is_downvoted question.voters.pluck(:id).include?(current_user.id)
end
