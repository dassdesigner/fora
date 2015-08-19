json.array!(@questions) do |question|
  json.extract! question, :id, :title, :body, :author_id

  json.user do
    json.name question.user.name
  end
end
# 
# json.tags current_user.tags do |tag|
#   json.extract! tag, :id, :title
# end
