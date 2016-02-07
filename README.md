# Fora

##[www.thefora.io](http://www.thefora.io)


Fora is an online forum inspired by Quora built with Rails, PostgreSQL, Backbone.js, Bootstrap,
and jQuery. I started this project in August of 2015 and I still find joy in improving and expanding functionality
in my spare time.

##Main Functionality
- Ask and answer questions
- Search for questions by title or topic
- Upvote questions and answers
- View questions by topic
- Follow and create topics

##Future features
- Image uploading
- User profiles
- Following users
- Recommended questions

##Challenges
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
##Fun Stuff
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
## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Adding Questions (~1 day)
I will implement user authentication in Rails and push to Heroku.
Finally,I will integrate bootstrap to provide a clean
interface.

[Details][phase-one]

### Phase 2: Viewing and Creating Questions (~1 day)
I will add API routes to serve question data as JSON, then add Backbone
models and collections that fetch data from those routes. By the end of this
phase, users will be able to create and view questions from a single page
Backbone app.

[Details][phase-two]

### Phase 3: Viewing and Displaying Answers (~1-2 days)
I will add API routes to serve answer data as part of a Composite view. By the
end of this phase users will be able to submit and view answers to a specific
question.

[Details][phase-three]

### Phase 4: Adding Topics to Users and Questions (~2 days)
I will add an association for topics and users such that any user can create and
follow a topic. I will also add an association between questions and topics such
that a user can add topics to a given question.

[Details][phase-four]

### Phase 5: Main Page + Topic Page (~2 days)
I will add a Feed route that retrieves questions based on the current user's
followed topics. In the future, these will be sorted on an upvote/downvote basis,
but for now they will be ordered by the latest answered question. This will serve
as the landing page. I will also make a topic show page containing all the
questions for a given topic, displaying the topic information at the top of the
page.

[Details][phase-five]

### Phase 6: Search (~2 days) (TBD)
I will add a feed route to the Questions controller which will serve up
questions based on search queries. This will be displayed in a Search Show composite view containing a list of matching questions.

[Details][phase-six]

###Phase 7: Beautify with CSS/ Javascript
I will have 2 main columns. The left column will be a sidebar containing the
current user's followed topics. The right (main column) will consist of the
current show page (feedShow/topicShow/questionShow). Details TBD.

### Phase 8: Voting (~1~2 days) (Details TBD)
Users will be able to upvote or downvote answers and questions. This information
will be used to sort questions on both the feed and topic pages. This will also
determine the top answer shown for each question on the above pages. In addition,
answers on the question show page will be sorted by votes.

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
[phase-six]: ./docs/phases/phase6.md
