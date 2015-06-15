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

25.times do |n|
  another_deck = Deck.create!(title: Faker::Name.title, owner_id: user2.id)
  50.times do |n|
    card1 = Card.create!(deck_id: another_deck.id, question: Faker::Lorem.word, answer: Faker::Lorem.paragraph(1))
    card2 = Card.create!(deck_id: another_deck.id, question: Faker::Lorem.word, answer: Faker::Lorem.paragraph(1))
    resp1 = Response.create!(card_id: card.id, user_id: user1.id, quality: 4)
  end
end
Card.create!(deck_id: portuguese.id, question: 'cidade', answer: 'city')
Card.create!(deck_id: portuguese.id, question: 'legal', answer: 'cool')
Card.create!(deck_id: portuguese.id, question: 'amigos', answer: 'friends')
Card.create!(deck_id: portuguese.id, question: 'garota', answer: 'girl')
Card.create!(deck_id: portuguese.id, question: 'logo', answer: 'soon')
Card.create!(deck_id: portuguese.id, question: 'rapido', answer: 'quick')
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
