# Schema Information

## Diagram
![diagram]

[diagram]: ./schema_diagram.png

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
password_digest | string    | not null
session_token   | string    | not null, unique
name            | string    | not null
description     | string    |

## answers
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
title       | string    | not null
body        | string    | not null
votes       | integer   | not null

## questions
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
title       | string    | not null
body        | string    |
votes       | integer   | not null

## user_followings
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
followee_id | integer   | not null, foreign key (references users)
follower_id | integer   | not null, foreign key (references users)

## topic_taggings
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
topic_id    | integer   | not null, foreign key (references topics)
tagger_id   | integer   | not null, foreign key (references users, questions )


## topics
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
title       | string    | not null
description | string    |
