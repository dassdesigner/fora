json.extract! @tag, :id, :title
  debugger;
json.array!(@tag.questions) do |question|
  json.partial! "api/questions/question", question: question
end
