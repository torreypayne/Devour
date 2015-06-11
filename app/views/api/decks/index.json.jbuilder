json.array!(@decks) do |deck|
  json.(deck, :id, :title, :owner_id, :course_id, :public)
end
