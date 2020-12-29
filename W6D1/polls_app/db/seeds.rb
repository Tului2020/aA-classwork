# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
user1 = User.create!(username: 'alexey')
user2 = User.create!(username: 'tului')

Poll.destroy_all
poll1 = Poll.create!(user_id: user1.id, title: "hello")
poll2 = Poll.create!(user_id: user2.id, title: "hello-again")

Question.destroy_all
question1 = Question.create!(poll_id: poll1.id, text: "thinking too much?")
question2 = Question.create!(poll_id: poll1.id, text: "bla-bla?")
question3 = Question.create!(poll_id: poll2.id, text: "skys are down?")
question4 = Question.create!(poll_id: poll2.id, text: "open my eyes?")

AnswerChoice.destroy_all
answer1a = AnswerChoice.create!(question_id: question1.id, text: "true1")
answer1b = AnswerChoice.create!(question_id: question1.id, text: "false1")

answer2a = AnswerChoice.create!(question_id: question2.id, text: "true2")
answer2b = AnswerChoice.create!(question_id: question2.id, text: "false2")

answer3a = AnswerChoice.create!(question_id: question3.id, text: "true3")
answer3b = AnswerChoice.create!(question_id: question3.id, text: "false3")

answer4a = AnswerChoice.create!(question_id: question4.id, text: "true4")
answer4b = AnswerChoice.create!(question_id: question4.id, text: "false4")

Response.destroy_all
response1 = Response.create!(user_id: user1.id, answer_choice_id: answer1a.id)
response2 = Response.create!(user_id: user1.id, answer_choice_id: answer2b.id)
response3 = Response.create!(user_id: user1.id, answer_choice_id: answer3a.id)
response4 = Response.create!(user_id: user1.id, answer_choice_id: answer4b.id)

response5 = Response.create!(user_id: user2.id, answer_choice_id: answer1b.id)
response6 = Response.create!(user_id: user2.id, answer_choice_id: answer2a.id)
response7 = Response.create!(user_id: user2.id, answer_choice_id: answer3b.id)
response8 = Response.create!(user_id: user2.id, answer_choice_id: answer4b.id)





# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
