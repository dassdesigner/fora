json.extract! @question, :id, :title, :body, :author_id
json.question_author User.find(@question.author_id).name
# json.answer_count @question.answers.count
json.vote @votes_hash[@question.id]
json.num_upvotes @question.votes.size
json.tags @question.tags do |tag|
  json.extract! tag, :id, :title, :description
end
json.voters (!@question.votes.empty? && @question.votes.map {|v| User.find(v.user_id)}).map {|u| {img_src: u.img_src, name: u.name}} || "No one!"
json.more_questions Question.more_questions(@question) do |more_question|
  json.extract! more_question, :title, :id, :answers
  top_answer = more_question.answers.first
  if top_answer
    json.extract! top_answer.author, :img_src, :name
    json.body top_answer.body
    json.date top_answer.created_at.to_date.to_formatted_s(:short)
  else
    json.body more_question.body
    json.date more_question.created_at.to_date.to_formatted_s(:short)
  end

end
json.related_questions Question.related_questions(@question) do |related_question|
  json.extract! related_question, :title, :id
  json.tag_title related_question.tags.first.title
end
# debugger
