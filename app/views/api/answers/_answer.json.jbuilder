json.extract! answer, :id, :body, :author_id, :author_bio
json.voters (!answer.votes.empty? && answer.votes.map {|v| User.find(v.user_id)}.map(&:name)) || "No one!"
json.answer_date answer.created_at.to_date.to_formatted_s(:short)
json.answer_author answer.author.name
json.answer_author_avatar answer.author.img_src
json.vote votes_hash[answer.id]
json.num_upvotes answer.votes.size
json.answer_author answer.author.name
