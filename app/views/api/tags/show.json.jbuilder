json.extract! @tag, :id, :title
json.questions do
  json.partial! 'api/questions/questions', questions: @tag.questions, votes_hash: @votes_hash
end
