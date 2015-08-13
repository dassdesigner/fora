# Fora

[Heroku link][heroku]

[heroku]: http://foraforafora.herokuapp.com

## Minimum Viable Product
Fora is a clone of Quora where users can ask and answer questions. Users will be
able to:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [x] Create accounts
- [x] Create sessions (log in)
- [x] Create Questions
- [ ] Create Answers for Questions
- [ ] View Questions with their Answers
- [ ] Create Topics for Questions
- [ ] Follow Questions, Users, and Topics
- [ ] View Followed Questions, Users, and Topics
- [ ] Search for Questions by Title or Topic
- [ ] Upvote/Downvote Questions

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Adding Questions (~1 day)
I will implement user authentication in Rails based on the practices learned at App Academy. The most important part of this phase
will be pushing the app to Heroku and ensuring that everything works before
moving on to phase 2. Finally,I will integrate bootstrap to provide a clean
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


### Bonus Features (TBD)
- [ ] User Pages
- [ ] Notifications
- [ ] Deleting Posts
- [ ] Comments on Answers
- [ ] Pagination/infinite scroll
- [ ] Activity history (e.g. upvoted answers)
- [ ] Typeahead search bar
- [ ] Searching by topic
[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
[phase-six]: ./docs/phases/phase6.md
