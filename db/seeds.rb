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

q1 = Question.create(title: 'What is your favorite cat picture?', author_id: 1)
q2 = Question.create(title: "What in your life makes you feel rich?", author_id: 2)
q3 = Question.create(title: "What... is your favourite colour?", author_id: 6)
q4 = Question.create(title: 'How do I use Backbone?', body: "Looking for a guide on the Dark Arts.", author_id: 5)
q5 = Question.create(title: 'What... is the air-speed velocity of an unladen swallow?', author_id: 6)
q6 = Question.create(title: 'Who are John Snow\'s real parents?', author_id: 4 )
q7 = Question.create(title: 'What is your morning routine?', body: "I\'ve been looking for a new one.", author_id: 9)
q8 = Question.create(title: 'What part of your daily routine do you look forward to the most?', body: "I believe in taking care of myself, and a balanced diet and a rigorous exercise routine. In the morning, if my face is a little puffy, I\'ll put on an ice pack while doing my stomach crunches. I can do a thousand now. After I remove the ice pack, I use a deep pore cleanser lotion. In the shower, I use a water activated gel cleanser. Then a honey almond body scrub. And on the face, an exfoliating gel scrub. Then apply an herb mint facial mask, which I leave on for 10 minutes while I prepare the rest of my routine. I always use an aftershave lotion with little or no alcohol, because alcohol dries your face out and makes you look older. Then moisturizer, then an anti-aging eye balm followed by a final moisturizing protective lotion. There is an idea of a Patrick Bateman, some kind of abstraction, but there is no real me. Only an entity, something illusory. And though I can hide my cold gaze, and you can shake my hand and feel flesh gripping yours and maybe you can even sense our life styles are probably comparable, I simply am not there.", author_id: 8)
q9 = Question.create(title: 'What actor played his role perfectly?', author_id: 6)
q10 = Question.create(title: 'What is a great movie that no one ever talks about?', author_id: 5, body: "I recently discovered Harry is in a movie where he plays a Centaur.")
q11 = Question.create(title: 'What are some good vacation spots in California?', author_id: 5)
q12 = Question.create(title: 'How many monitors do you use when programming?', author_id: 2)
q13 = Question.create(title: 'What are the differences between the main Javascript frameworks?', author_id: 2)
q14 = Question.create(title: 'What is your favorite flavor of Ice Cream?', author_id: 6, body: 'I really like Cookies and Cream.')
a1 = Answer.create(author_bio: "Cat Expert.", body: "<img alt=\"\" src=\"http://i.imgur.com/veDzg0r.jpg\" title=\"\" style=\"\"><br><br>Why?<br><ul><li><span style=\"line-height: 1.42857;\">This cat has a blue tail</span><br></li><li><span style=\"line-height: 1.42857;\">It looks&nbsp;</span><span style=\"line-height: 25.7143px;\">mischievous</span><br></li></ul><span style=\"line-height: 1.42857;\">&nbsp;Therefore, it is my favorite cat picture.</span><br>",
                           author_id: 2, question_id: 1)

a2 = Answer.create(author_bio: "Co-author on Beasts, and where to find them", body: "<img src=\"https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg\" title=\"Image: https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg\"><br>", author_id: 5, question_id: 1)

a3 = Answer.create(author_bio: "I enjoy cake", body: "Big packs of new <b>socks</b>. Maybe some <b>cake</b> that's not too smushed. A big 'ole <b>hug</b> from Harry!", author_id: 3, question_id: 2)
a4 = Answer.create(author_bio: "Son of Tywin", body: "My hand. And Lannister gold! ", author_id: 4, question_id: 2)
a5 = Answer.create(author_bio: "Expert in Wizardry", body: 'My timeturner! And Ron :^)', author_id: 5, question_id: 2)
a6 = Answer.create(author_bio: "Enjoyer of Colors", body: 'Blue.', author_id: 7, question_id: 3)
a7 = Answer.create(body: "Blue. No, yel...", author_id: 8, question_id: 3)
a8 = Answer.create(author_bio: "I keep bridges", body: "Huh? I... I don't know that. AGGGghhhh", author_id: 6, question_id: 5)
a9 = Answer.create(author_bio: "I cross bridges", body: "What do you mean? An African or European swallow?", author_id: 9, question_id: 5)
a10 = Answer.create(author_bio: "Professor", body: "Coffee and Reddit.", author_id: 2, question_id: 7)
a11 = Answer.create(author_bio: "Student", body: "After five alarms go off every 15 minutes, finally wake up. Check Reddit for news. Check local news. Get breakfast. Get ready for uni. Go to uni. Realise I left my lab coat in my room half way to uni. Drive back home and get jacket. Go back to uni.", question_id: 7, author_id: 5)
a12 = Answer.create(author_bio: "Conspiracy Theorist", body: "<b>Eddard Stark</b> AND <b>Ashara Dayne</b>", question_id: 6, author_id: 8)
a13 = Answer.create(author_bio: "Conpiracy Theorist", body: "<b>Eddard Stark</b> and <b>Wylla</b>", question_id: 6, author_id: 8)
a14 = Answer.create(author_bio: "Son of Tywin", body: "Getting home and seeing my girl after a hard day's work. My girl is my cat.", author_id: 4, question_id: 8)
a15 = Answer.create(author_bio: "King", body: "John Cleese", author_id: 9, question_id: 9)
a16 = Answer.create(author_bio: "King", body: "Graham Chapman", author_id: 9, question_id: 9)
a17 = Answer.create(author_bio: "Film Enthusiast", body: "<b>Sneakers.</b> One of my favorite movies and nobody I know has ever seen it.\n Awesome cast - Robert Redford, Sidney Poitier, Dan Aykroyd, River Phoenix, Mary McDonnell, David Strathairn, Ben Kingsley, Stephen Tobolowsky, James Earl Jones", author_id: 8, question_id: 10)
a18 = Answer.create(question_id: 14, author_id: 1, author_bio: "UC Berkeley Student", body: "<img alt=\"\" src=\"http://www.simplecomfortfood.com/images/cookies-n-cream.jpg\"><br><br>I like Cookies and Cream too! It was my favorite flavor as a child. Nowadays, with hipsters moving into my neighborhood, I get to try flavors like <b>Rose Vanilla</b> and <b>Earl Grey</b>, flavors I had no idea existed as a child. That being said, my favorite ice cream flavor is not a constant variable. It is always changing, depending on the season, my mood, and the creativity of places where I get ice cream. Did you know when I was little, I didn't like ice cream at all. And it took me a long time to like chocolate ice cream. I thought chocolate ice cream would be too sweet, but it's actually really nice and LESS SWEET than the other flavors. What a great question! I love answering questions.<br>")
a19 = Answer.create(question_id: 4, author_bio: "Doc Diver", author_id: 9, body: "<a href=\"http://backbonejs.org/\">http://backbonejs.org/</a> <br>")
a20 = Answer.create(question_id: 11, author_bio: "Vacation Expert", author_id: 4, body: "Here's a great resource!&nbsp;<a href=\"http://www.latimes.com/travel/california/la-tr-1118-top15-pg-photogallery.html\">http://www.latimes.com/travel/california/la-tr-1118-top15-pg-photogallery.html</a>" )
t1 = Tag.create({title: "Life", description: "On the period of time between birth and death."})
t2 = Tag.create({title: "Humor", description: "Humans find this humorous."})
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
t13 = Tag.create(title: "Films", description: "Pictures that move!")
t14 = Tag.create(title: "Nothing", description: "Nothing goes here!")
t15 = Tag.create(title: "Programming", description: "Computer programming is the craft of writing useful, maintainable, and extensible source code which can be interpreted or compiled by a computing system to perform a meaningful task.")
q1.tags << t1 << t2 << t3
q2.tags << t1 << t3
q3.tags << t1 << t3 << t4 << t5 << t6 << t7 << t8
q4.tags << t9 << t10
q5.tags << t5 << t6 << t7 << t11 << t12
q8.tags << t1 << t9 << t13
q9.tags << t12 << t1 << t13
q12.tags << t15
q13.tags << t15
q14.tags << t1
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
u1.tags << Tag.all
u2.tags << Tag.all.take(5)
u3.tags << Tag.all.take(5)
u4.tags << Tag.all.sample(5)
u5.tags << Tag.all.sample(5)
u6.tags << Tag.take(9)
u7.tags << Tag.all.sample(5)
u8.tags << Tag.all.sample(5)
Answer.all.take(5).map{|a| a.votes.create!(user_id: 1, value: 1)}

Question.all.sample(3).map {|q| q.votes.create!(user_id: 3, value: 1)}
Question.all.take(5).map {|q| q.votes.create!(user_id: 4, value: 1)}
Question.all.take(5).map {|q| q.votes.create!(user_id: 5, value: 1)}
Question.all.map {|q| q.votes.create!(user_id: 7, value: 1)}
Question.all.map {|q| q.votes.create!(user_id: 8, value: 1)}
Question.all.map {|q| q.votes.create!(user_id: 9, value: 1)}
Answer.all.take(5).map {|a| a.votes.create!(user_id: 5, value: 1)}
Answer.all.take(5).map {|a| a.votes.create!(user_id: 7, value: 1)}
Answer.all.map {|a| a.votes.create!(user_id: 8, value: 1)}
Answer.all.map {|a| a.votes.create!(user_id: 9, value: 1)}
