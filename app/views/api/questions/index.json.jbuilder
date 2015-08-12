json.array!(@questions) do |question|
  json.extract! question, :id, :title, :body, :author_id
end
