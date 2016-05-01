json.extract! @tag, :id, :title, :description
json.followed @tag.users.include?(current_user)
json.num_follows @tag.tag_followings.size
json.follow @follows_hash[@tag.id]
# json.questions do
  # json.partial! 'api/questions/questions', questions: @tag.questions, votes_hash: @votes_hash
# end
