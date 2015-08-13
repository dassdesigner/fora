# Phase 3: Viewing and Displaying Answers

### Models
* Answer

### Controllers
Api::AnswersController (create, destroy, index, show, update)

### Views
questions/show.json.jbuilder
### Models
* Question
* Answer

### Collections
* Answers

### Views
* QuestionShow (composite view containing AnswersIndex and AnswersForm)
* AnswersIndex (composite view containing AnswersIndexItem)
* AnswersIndexItem
* AnswerShow
* AnswerForm
