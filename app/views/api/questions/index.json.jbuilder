json.array!(@questions) do |question|
  json.extract! question, :id, :title, :body, :author_id

  json.user do
    json.name question.user.name
  end
end
