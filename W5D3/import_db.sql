PRAGMA foreign_keys = ON;

.headers on
.mode column

DROP TABLE if exists users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL

);
INSERT INTO
  users (fname, lname)
VALUES
  ('Alexey', 'Sergeev'),
  ('Tului', 'Gantulga' ),
  ('Dwaine', 'Johnson' ),
  ('Sasha', 'Vladimir' ),
  ('Will', 'Smith' );




DROP TABLE if exists questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
); 
INSERT INTO
  questions (title, body, user_id)
VALUES
  ('SQL', 'How do we do this?', 1),
  ('SQLite3', 'is syntax different?', 2),
  ('SQL', 'Hello?', 3),
  ('SQL', 'How do we do this?', 4),
  ('SQL', 'Whats your name', 3),
  ('SQL', 'who are you?', 5),
  ('SQL', 'where are you from?', 1);




DROP TABLE if exists question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  questions_id INTEGER NOT NULL,
  users_id INTEGER NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id)
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);
INSERT INTO
  question_follows (questions_id, users_id)
VALUES
  (1, 2);



DROP TABLE if exists replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  questions_id INTEGER NOT NULL,
  parent_id INTEGER,
  users_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id)
  FOREIGN KEY (questions_id) REFERENCES questions(id)  
);
INSERT INTO
  replies (questions_id, parent_id, users_id, body)
VALUES
  (1, null, 2, "Who cares");



DROP TABLE if exists question_likes;

CREATE TABLE questions_likes (
  id INTEGER PRIMARY KEY,
  number_likes INTEGER,
  questions_id INTEGER NOT NULL,
  users_id INTEGER NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id)
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);


INSERT INTO
  questions_likes (number_likes, questions_id, users_id)
VALUES
  (10, 1, (SELECT users.id FROM users WHERE users.id = 2));








