json.extract! @tag, :id, :title
json.followed @tag.users.include?(current_user)
json.questions do
  json.partial! 'api/questions/questions', questions: @tag.questions, votes_hash: @votes_hash
end
