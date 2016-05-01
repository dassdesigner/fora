json.extract! question, :id, :body, :title, :author_id
json.date question.created_at.to_date.to_formatted_s(:short)
json.vote votes_hash[question.id]
json.voters (!question.votes.empty? && question.votes.map {|v| User.find(v.user_id)}.map {|u| {img_src: u.img_src, name: u.name}}) || "No one!"
json.num_upvotes question.votes.count
if !question.tags.empty?
  tag = question.tags.sample
  json.tag_id tag.id
  json.tag_title tag.title
end
if answer
  json.answer_id answer.id
  json.answer_date answer.created_at.to_date.to_formatted_s(:short)
  json.answer_body answer.body
  json.answer_author answer.author.name
  json.answer_author_avatar answer.author.img_src
  # json.vote votes_hash[answer.id]
  # json.num_upvotes answer.votes.size
  json.answer_author answer.author.name
  json.state "Answer Written"
  json.author_bio answer.author_bio
else
  json.state "Question Asked"
end
