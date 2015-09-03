# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(name: 'Joan of Arc', email: 'guest@gmail.com', password: '123456')
u2 = User.create(name: 'Dumbledore', email: 'cat@cat.com', password: 'catcat')
u3 = User.create(name: 'Hagrid', email: 'spider@man.com', password: 'gotweb')
u4 = User.create(name: 'Jamie Lannister', email: 'hanstheg@gmail.com', password: 'willis')
u5 = User.create(name: 'Hermione', email: 'snape@gmail.com', password: 'dumbledore')
u6 = User.create(name: 'Bridgekeeper', email: 'the@guest.com', password: 'supersecurepassword')
u7 = User.create(name: 'Sir Lancelot', email: 'lancelot@fora.com', password: 'supersecurepassword')
u8 = User.create(name: 'Galahad', email: 'serobertstrong@fora.com', password: 'supersecurepassword')
u9 = User.create(name: 'King Arthur', email: 'onetrue@fora.com', password: 'supersecurepassword')

q1 = Question.create(title: 'Fora, what are your College lifehacks??', author_id: 1)
q2 = Question.create(title: "What in your life makes you feel rich?", body: "I\'m steady trying to figure it out.", author_id: 2)
q3 = Question.create(title: 'Who goes there?', body: "What... is your favourite colour?", author_id: 6)
q4 = Question.create(title: 'How do I use Backbone?', body: "Looking for a guide on the Dark Arts.", author_id: 5)
q5 = Question.create(title: ' What... is the air-speed velocity of an unladen swallow?', author_id: 6)

a1 = Answer.create(body: "This is more for the academic side of college; specifically essays.
Trick 1: If you find your essay on the short end of the word count and can't write anything coherent then simply give the illusion that you wrote more.

Step 1: Control+F within your essay. And when the box appears, click advanced, or more.
Step 2: you'll be presented with options to modify the letter or word your searching for now. This includes font, size and replacement. You want replacement.
Step 3: You now search for a full stop. So in the search box you type '.' and then proceed to raise the size from 12 (presuming you apply standard essay formatting) to* 14 or 16. I usually go 15 but depending on how short I am, I have gone as high as 17.
Step 4: Once you've changed the size of full stops from 12 to your preferred size, you click the 'replace all with' button and boom! You just made your essay half a page and onwards longer without actually making it look suspicious.
Depending on your severity and size of essay, this can be applied to commas, brackets, semicolons, minor words (to, too, a, the, etc. - but proceed with caution with words since they become noticable with the most minor changes, so it is advised to only go up 1 size.. Max 2 depending on how many letters and the* consistency of word).
I hope this may of been some help for some students struggling out there. Also, while I'm at it, I'd also like to state that I am in no way advising you to skip out on doing your essay or half ass it.
Put the effort in. Find the articles, journals, documents and books and write a good essay. This is simply for those essays that come a long and require too many words for a simple* topic or discussion.",
                           author_id: 2, question_id: 1)

a2 = Answer.create(body: "Treat undergrad like a full time job.
Everyday, no matter what time your classes start, make sure you're working by 8:30 or 9:00. You work for 8 hours every weekday.
This includes going to class and labs, but any other time between 9-5, you should be either reading, studying or getting started on your papers.ssss
You will have the best college life if you do this. Assuming you have about 15-20 hours of class per week, this leaves you another 20-25 for all the reading, studying, assignments and such. Do it like this and you'll be able to spend all your evenings and weekends having the social college experience. You'll never have to cram for an exam or spend an all-nighter to get a paper done. You will probably get really solid grades, too.
Do it like this and you will be the only person you know who succeeds in all three categories: good grades, enough sleep, fun.", author_id: 5, question_id: 1)

a3 = Answer.create(body: "Big packs of new socks", author_id: 3, question_id: 2)
a4 = Answer.create(body: "My book case and my Lamborghini in my garage that I use to drive in the Beverly Hills make me feel rich.", author_id: 4, question_id: 2)
a5 = Answer.create(body: 'I always say that the more you learn, the more you earn.', author_id: 5, question_id: 2)

a6 = Answer.create(body: 'Blue', author_id: 7, question_id: 3)
a7 = Answer.create(body: "Blue. No, yel...", author_id: 3, question_id: 3)

a8 = Answer.create(body: "Huh? I... I don't know that. AGGGghhhh", author_id: 6, question_id: 5)
a9 = Answer.create(body: "What do you mean? An African or European swallow?", author_id: 9, question_id: 5)

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
