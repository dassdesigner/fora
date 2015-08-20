json.extract! @tag, :id, :title
json.questions @tag.questions do |question|
  json.extract! question, :id, :title, :body, :author_id
end
