# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create!(email: 'payne@payne.com', password: 'password')
user2 = User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
user3 = User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
user4 = User.create!(email: 'payne2@payne.com', password: 'password')

portuguese = Deck.create!(title: 'Portuguese', owner_id: user.id)
turkish = Deck.create!(title: 'Turkish', owner_id: user.id)

4.times do |n|
  some_deck = Deck.create!(title: Faker::Name.title, owner_id: user.id)
  20.times do |n|
    card1 = Card.create!(deck_id: some_deck.id, question: Faker::Lorem.word, answer: Faker::Lorem.paragraph(1))
    card2 = Card.create!(deck_id: some_deck.id, question: Faker::Lorem.word, answer: Faker::Lorem.paragraph(1))
  end
end

4.times do |n|
  another_deck = Deck.create!(title: Faker::Name.title, owner_id: user2.id)
  20.times do |n|
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
      card = Card.create!(deck_id: foreign_language_deck.id, question: question, answer: answer)
    end
  end
end
Card.create!(deck_id: turkish.id, question: 'bir', answer: 'a')
Card.create!(deck_id: turkish.id, question: 've', answer: 'and')
Card.create!(deck_id: turkish.id, question: 'olmak', answer: 'be')
Card.create!(deck_id: turkish.id, question: 'bu', answer: 'this')
Card.create!(deck_id: turkish.id, question: 'o', answer: 'the')
Card.create!(deck_id: turkish.id, question: 'demek', answer: 'say')
Card.create!(deck_id: turkish.id, question: 'yapmak', answer: 'do')
Card.create!(deck_id: turkish.id, question: 'ne', answer: 'not')
Card.create!(deck_id: turkish.id, question: 'gibi', answer: 'as')
Card.create!(deck_id: turkish.id, question: 'daha', answer: 'more')
Card.create!(deck_id: turkish.id, question: 'almak', answer: 'buy')
Card.create!(deck_id: turkish.id, question: 'var', answer: 'was')
Card.create!(deck_id: turkish.id, question: 'kendi', answer: 'own')
Card.create!(deck_id: turkish.id, question: 'gelmek', answer: 'come')
Card.create!(deck_id: turkish.id, question: 'ile', answer: 'with')
Card.create!(deck_id: turkish.id, question: 'vermek', answer: 'give')
Card.create!(deck_id: turkish.id, question: 'ama', answer: 'but')
Card.create!(deck_id: turkish.id, question: 'sonra', answer: 'after')
Card.create!(deck_id: turkish.id, question: 'kadar', answer: 'up to')
Card.create!(deck_id: turkish.id, question: 'yer', answer: 'location')
Card.create!(deck_id: turkish.id, question: 'en', answer: 'in')
Card.create!(deck_id: turkish.id, question: 'insan', answer: 'man')
Card.create!(deck_id: turkish.id, question: 'istemek', answer: 'ask')
Card.create!(deck_id: turkish.id, question: 'zaman', answer: 'time')
Card.create!(deck_id: turkish.id, question: 'ya', answer: 'to')
Card.create!(deck_id: turkish.id, question: 'yok', answer: 'no')
Card.create!(deck_id: turkish.id, question: 'kalmak', answer: 'stay')
