# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(name: 'Joey', email: 'guest@gmail.com', password: '123456')
u2 = User.create(name: 'cat', email: 'cat@cat.com', password: 'catcat')
u3 = User.create(name: 'Spiderman', email: 'spider@man.com', password: 'gotweb')
u4 = User.create(name: 'Hans Gruber', email: 'hanstheg@gmail.com', password: 'willis')
u5 = User.create(name: 'Severus', email: 'snape@gmail.com', password: 'dumbledore')

q1 = Question.create(title: 'How are you doing?', body: 'how U doin?', author_id: 1)
q2 = Question.create(title: 'Meow meow?', body: 'Meowwwwwwwwwwwwwwwwwwwwww', author_id: 2)
q3 = Question.create(title: 'How do I shot web?', body: "I've been looking everywhere!", author_id: 3)
q4 = Question.create(title: 'How do I use Backbone?', body: "Looking for a guide on the Dark Arts.", author_id: 4)

a1 = Answer.create(body: 'Let me get back to you on that one.', author_id: 5, question_id: 4)
a2 = Answer.create(body: 'Mewmew (pewpew?)', author_id: 2, question_id: 3)
a3 = Answer.create(body: '>w< baka', author_id: 4, question_id: 1)
a4 = Answer.create(body: 'Calm down now Minerva.', author_id: 5, question_id: 2)
