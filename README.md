# Fora

## [www.thefora.io](http://www.thefora.io)

Fora is an online forum inspired by Quora built with Rails, PostgreSQL, Backbone.js, Bootstrap, and jQuery. I started this project in August of 2015 and I still find joy in improving and expanding functionality in my spare time.

## Main Functionality

- Ask and answer questions
- Search for questions by title or topic
- Upvote questions and answers
- View questions by topic
- Follow and create topics

## Additional Features

- Explore! Look at topics that you aren't following yet
- Related Questions- See questions that share the current question's topics
- More Questions- See more questions from your feed when looking at a question
- Bio- Add background information to your questions to show your expertise in the area
- Answer- View questions that don't have answers yet

## Future features

- Image uploading
- User profiles
- Following users

## Challenges

One of the more challenging engineering problems involved figuring out how to delete a topic from either a question or a user without deleting the topic itself. This involved sending additional parameters in Backbone's destroy method

```javascript
this.model.destroy({
  data: {
    tag_type: this.tagType,
    question_id: this.questionId
  },
  processData: true
});
```

to the Rails controller to indicate whether I was deleting from a user's tags or a question's tags, in addition to the ID of the question (if applicable) I was deleting from.

```ruby
if params["tag_type"] == "user"
  @tag = current_user.tags.destroy(params[:id])
elsif params["tag_type"] == "question"
  @tag = Question.find(params["question_id"]).tags.destroy(params[:id])
end
```

## Fun Stuff

One of the funner things to do was implement a backend search. While I can be certain that Google's search indexing won't be contacting me any time soon, I can rely on my website not being bogged down by having gigabytes of data.

The search starts with sending a query to the index method of the questions controller:

```ruby
if params[:query]
  @questions = (Question.topic_matches(params[:query]) + Question.title_matches(params[:query])).uniq.sort{|a,b| b.votes.count <=> a.votes.count}
  ...
```

and keeping the bulk of the logic inside the Question model:

```ruby
def self.topic_matches(query)
    query_arr = query.split(" ")
    Question.all.select {|q| q.tags.any? { |tag| query_arr.any? { |query_word| tag.title.downcase.include?(query_word.downcase)}}}
end

def self.title_matches(query)
  query_arr = query.split(" ")
  Question.all.select {|q| query_arr.any? { |query_word| q.title.downcase.include?(query_word.downcase)}}
end
```

In the end, this gets us an array of questions matching to either the topic or title of the question. Searching based on question answers probably wouldn't be difficult to do (albeit inefficiently). This would involve using roughly the same logic as the title_matches method.

### Screenshots

![](/docs/homepage.png)

![](/docs/ex_question.png)
