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

4.times do |n|
  another_deck = Deck.create!(title: Faker::Name.title, owner_id: user2.id)
  15.times do |n|
    card1 = Card.create!(deck_id: another_deck.id, question: Faker::Lorem.word, answer: Faker::Lorem.paragraph(1))
    card2 = Card.create!(deck_id: another_deck.id, question: Faker::Lorem.word, answer: Faker::Lorem.paragraph(1))
    resp1 = Response.new(card_id: card1.id, user_id: user2.id, quality: 4)
    resp1.assert_response(user2.id)
    resp2 = Response.new(card_id: card1.id, user_id: user2.id, quality: 4, e_factor: resp1.e_factor, repetitions: resp1.repetitions)
    resp2.assert_response(user2.id)
  end
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
