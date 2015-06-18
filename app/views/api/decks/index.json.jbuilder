json.array!(@decks) do |deck|
  json.extract! deck, :id, :title, :owner_id, :course_id, :public
  json.cards_length deck.cards.length
end
