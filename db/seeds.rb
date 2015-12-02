# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(name: 'Joan of Arc', email: 'guest@gmail.com', password: '123456', img_src: "http://i.imgur.com/UNM69eO.jpg")
u2 = User.create(name: 'Dumbledore', email: 'cat@cat.com', password: 'catcat', img_src: "http://i.imgur.com/EZDxLte.jpg")
u3 = User.create(name: 'Hagrid', email: 'spider@man.com', password: 'gotweb', img_src: "http://i.imgur.com/jve8z3t.jpg")
u4 = User.create(name: 'Jamie Lannister', email: 'hanstheg@gmail.com', password: 'willis', img_src: "http://i.imgur.com/ktGaqTz.jpg")
u5 = User.create(name: 'Hermione', email: 'snape@gmail.com', password: 'dumbledore', img_src: "http://i.imgur.com/rslzIBM.jpg")
u6 = User.create(name: 'Bridgekeeper', email: 'the@guest.com', password: 'supersecurepassword', img_src: "http://i.imgur.com/8GGsJhp.jpg")
u7 = User.create(name: 'Sir Lancelot', email: 'lancelot@fora.com', password: 'supersecurepassword', img_src: "http://i.imgur.com/JmAGGDv.jpg")
u8 = User.create(name: 'Patrick', email: 'serobertstrong@fora.com', password: 'supersecurepassword', img_src: "http://i.imgur.com/yiXreqb.jpg")
u9 = User.create(name: 'King Arthur', email: 'onetrue@fora.com', password: 'supersecurepassword', img_src: "http://i.imgur.com/EbnLwbH.jpg")

q1 = Question.create(title: 'Fora, what are your College lifehacks??', author_id: 1)
q2 = Question.create(title: "What in your life makes you feel rich?", author_id: 2)
q3 = Question.create(title: "What... is your favourite colour?", author_id: 6)
q4 = Question.create(title: 'How do I use Backbone?', body: "Looking for a guide on the Dark Arts.", author_id: 5)
q5 = Question.create(title: 'What... is the air-speed velocity of an unladen swallow?', author_id: 6)
q6 = Question.create(title: 'Who are John Snow\'s real parents?', author_id: 4 )
q7 = Question.create(title: 'What is your morning routine?', body: "I\'ve been looking for a new one.", author_id: 9)

a1 = Answer.create(body: "Go to office hours. 95% of the time, I'm sitting there on Fora hoping someone will stop by. Every prof I know is in a similar state except the week before the test. We will absolutely help you out and you'll get more out of the class than just showing up to class.",
                           author_id: 2, question_id: 1)

a2 = Answer.create(body: "Schedule more time than you think you'll need between classes. Things always come up, and you can always use the extra time to study.", author_id: 5, question_id: 1)

a3 = Answer.create(body: "Big packs of new socks", author_id: 3, question_id: 2)
a4 = Answer.create(body: "My hand.", author_id: 4, question_id: 2)
a5 = Answer.create(body: 'My timeturner!', author_id: 5, question_id: 2)
a6 = Answer.create(body: 'Blue.', author_id: 7, question_id: 3)
a7 = Answer.create(body: "Blue. No, yel...", author_id: 8, question_id: 3)
a8 = Answer.create(body: "Huh? I... I don't know that. AGGGghhhh", author_id: 6, question_id: 5)
a9 = Answer.create(body: "What do you mean? An African or European swallow?", author_id: 9, question_id: 5)
a10 = Answer.create(body: "Coffee and Reddit.", author_id: 2, question_id: 7)
a11 = Answer.create(body: "After five alarms go off every 15 minutes, finally wake up. Check Reddit for news. Check local news. Get breakfast. Get ready for uni. Go to uni. Realise I left my lab coat in my room half way to uni. Drive back home and get jacket. Go back to uni.", question_id: 7, author_id: 5)
a12 = Answer.create(body: "EDDARD STARK AND ASHARA DAYNE", question_id: 6, author_id: 8)
a13 = Answer.create(body: "EDDARD STARK AND WYLLA", question_id: 6, author_id: 8)

t1 = Tag.create({title: "Life", description: "On the period of time between birth and death."})
t2 = Tag.create({title: "College", description: "Those 4 + n years you'll never forget!"})
t3 = Tag.create({title: "Meta", description: "If it doesn't go anywhere else, just add this topic. It'll be fine."})
t4 = Tag.create({title: "Bridges", description: "A way to cross otherwise impassable gaps."})
t5 = Tag.create({title: "Quests", description: "See: this project. According to wikipedia: 'n mythology and literature, a quest, a journey towards a goal, serves as a plot device and (frequently) as a symbol.'"})
t6 = Tag.create({title: "Colors", description: "The spice of life!"})
t7 = Tag.create({title: "Bridge Crossing", description: "The act of moving from one end of a bridge to the other. See also: Bridges"})
t8 = Tag.create({title: "Magic", description: "The supernatural!"})
t9 = Tag.create({title: "Learning", description: "The act of retaining new information." })
t10 = Tag.create({title: "Wizardry", description: "Something to do with magic."})
t11 = Tag.create({title: "Grails", description: "A shiny cup of sorts. That plenty of people/beings seem to want."})
t12 = Tag.create({title: "Swallows", description: "A type of bird. Comes in African and European varieties."})

q1.tags << t1 << t2 << t3
q2.tags << t1 << t3
q3.tags << t1 << t3 << t4 << t5 << t6 << t7 << t8
q4.tags << t9 << t10
q5.tags << t5 << t6 << t7 << t11 << t12


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
