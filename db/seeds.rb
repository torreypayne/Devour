# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create!(email: 'payne@payne.com', password: 'password')
user2 = User.create!(email: 'payne2@payne.com', password: 'password')
10.times do |n|
  User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
end

languages = ['dutch', 'esperanto', 'icelandic', 'indonesian', 'japanese', 'portuguese', 'russian', 'spanish']
languages.each_with_index do |language, idx|
  foreign_language_deck = Deck.create!(title: language.capitalize, public: true, course_id: idx, owner_id: user.id)
  File.open('./vendor/assets/languages/' + language + '.txt','r') do |foreign_text|
    File.open('./vendor/assets/languages/extracted_text.txt', 'r') do |english_text|
      question = foreign_text.gets
      answer = english_text.gets
      while (question && answer)
        card = Card.create(deck_id: foreign_language_deck.id, question: question, answer: answer)
        question = foreign_text.gets
        answer = english_text.gets
      end
    end
  end
end

10.times do |n|
  5.times { |n| Message.create!(receiver_id: user.id, sender_id: Random.rand(10), body: Faker::Lorem.paragraph) }
  5.times { |n| Message.create!(receiver_id: Random.rand(10), sender_id: user.id, body: Faker::Lorem.paragraph) }
end
