# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(name: 'Joey', email: 'guest@gmail.com', password: '123456')
u2 = User.create(name: 'WhyAmIListeningToThis', email: 'cat@cat.com', password: 'catcat')
u3 = User.create(name: 'Spiderman', email: 'spider@man.com', password: 'gotweb')
u4 = User.create(name: 'Hans Gruber', email: 'hanstheg@gmail.com', password: 'willis')
u5 = User.create(name: 'Severus', email: 'snape@gmail.com', password: 'dumbledore')
u6 = User.create(name: 'Ohey There', email: 'the@guest.com', password: 'supersecurepassword')

q1 = Question.create(title: 'How you doing?', body: 'How YOU doin?', author_id: 1)
q2 = Question.create(title: 'Test post please ignore', body: 'Cat goes meow', author_id: 2)
q3 = Question.create(title: 'How do I shot web?', body: "I've been looking everywhere!", author_id: 3)
q4 = Question.create(title: 'How do I use Backbone?', body: "Looking for a guide on the Dark Arts.", author_id: 5)
q5 = Question.create(title: 'Will someone get me out of here!?', body: "Currently holed up with Bruce Willis.", author_id: 4)

a1 = Answer.create(body: "I'm coming out of my cage, And I’ve been doing just fine,
                          Gotta gotta be down, Because I want it all",
                           author_id: 2, question_id: 1)
a2 = Answer.create(body: "Just got back from a lunch date with Harry!", author_id: 5, question_id: 1)
a3 = Answer.create(body: "Feeling pretty webby.", author_id: 3, question_id: 1)
a4 = Answer.create(body: "Allow me to get in touch with Aragog. I'll get back to you on this.", author_id: 5, question_id: 3)
a5 = Answer.create(body: 'F', author_id: 2, question_id: 3)
a6 = Answer.create(body: '?!', author_id: 5, question_id: 5)
a7 = Answer.create(body: "I'm coming for you!", author_id: 3, question_id: 5)

q1.tags.create({title: "How YOU doin"})
q1.tags.create({title: "Wow I am hilarious!"})
  q2.tags.create({title: "I AM REALLY RUNNING OUT OF IDEAS"})
  q2.tags.create({title: "BUT THERE ARE SO MANY MORE THINGS TO DO"})
  q3.tags.create({title: "Webs"})
  q3.tags.create({title: "Spiders"})
  q3.tags.create({title: "Magic"})
  q4.tags.create({title: "Webs"})
  q4.tags.create({title: "The Joy of Learning"})
  q4.tags.create({title: "Magic"})
  q4.tags.create({title: "Sleep"})
  q5.tags.create({title: "The 1980s"})



u1.votes.create({voteable_id:1 ,voteable_type: "Question", value: 1})
u1.votes.create({voteable_id:2 ,voteable_type: "Question", value: 1})
u1.votes.create({voteable_id:3, voteable_type: "Question", value: 1})
u1.votes.create({voteable_id:4 ,voteable_type: "Question", value: 1})
u1.votes.create({voteable_id:5 ,voteable_type: "Question", value: 1})
u2.votes.create({voteable_id:1 ,voteable_type: "Question", value: 1})
u2.votes.create({voteable_id:2 ,voteable_type: "Question", value: 1})
u2.votes.create({voteable_id:3 ,voteable_type: "Question", value: 1})
u2.votes.create({voteable_id:4 ,voteable_type: "Question", value: 1})
u2.votes.create({voteable_id:5 ,voteable_type: "Question", value: 1})
u3.votes.create({voteable_id: 1,voteable_type: "Answer", value: 1})
u3.votes.create({voteable_id: 2,voteable_type: "Answer", value: 1})
u3.votes.create({voteable_id: 3,voteable_type: "Answer", value: 1})
u3.votes.create({voteable_id: 4,voteable_type: "Answer", value: 1})
u3.votes.create({voteable_id: 5,voteable_type: "Answer", value: 1})
u4.votes.create({voteable_id: 1,voteable_type: "Answer", value: 1})
u4.votes.create({voteable_id: 2,voteable_type: "Answer", value: 1})
u4.votes.create({voteable_id: 3,voteable_type: "Answer", value: 1})
u4.votes.create({voteable_id: 4,voteable_type: "Answer", value: 1})
u5.votes.create({voteable_id: 4,voteable_type: "Answer", value: 1})
u5.votes.create({voteable_id: 1,voteable_type: "Question", value: 1})
u6.tags << Tag.all
