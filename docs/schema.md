# Schema Information

## decks
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
owner_id    | integer   | not null, foreign key (references users)
title       | string    | not null
course_id   | integer   | not null, foreign key (references courses)

## courses
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
title       | string    | not null

## followings
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
course_id   | integer   | not null, foreign key (references courses)
follower_id | integer   | not null, foreign key (references users)

## cards
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
deck_id     | integer   | not null, foreign key (references users)
question    | string    | not null
answer      | string    |
next_rep    | datetime  | not null, default 0
e_factor    | integer   | not null, default 2.5

## tags
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
label       | string    | not null, unique

## taggings
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
post_id     | integer   | not null, foreign key (references posts)
tag_id      | integer   | not null, foreign key (references tags)

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
password_digest | string    | not null
session_token   | string    | not null, unique
