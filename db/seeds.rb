# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create(email: 'payne@payne.com', password: 'password')
portuguese = Deck.create(title: 'Portuguese', owner_id: user.id)
Card.create!(deck_id: 1, question: 'cidade', answer: 'city')
Card.create(deck_id: portuguese.id, question: 'legal', answer: 'great')
Card.create(deck_id: portuguese.id, question: 'amigos', answer: 'friends')
Card.create(deck_id: portuguese.id, question: 'garota', answer: 'girl')
Card.create(deck_id: portuguese.id, question: 'logo', answer: 'soon')
Card.create(deck_id: portuguese.id, question: 'rapido', answer: 'quick')
Card.create(deck_id: portuguese.id, question: 'momento', answer: 'moment')
