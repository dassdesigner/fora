json.extract! @tag, :id, :title
json.followed @tag.users.include?(current_user)
json.num_follows @tag.tag_followings.size
json.questions do
  json.partial! 'api/questions/questions', questions: @tag.questions, votes_hash: @votes_hash
end
