# Devour

[Heroku link][heroku]

[heroku]: http://devour.herokuapp.com

Devour comes complete with a test suite that verifies the functionality of the
app. The frequency list that provided the English words used in the test databases
are from the BNC Database by Adam Kilgarriff. The test suite verifies the
functionality of the forgetting curve, ensuring that each User is only tested
on cards that:
  1. Are in a deck shared with the User.
  2. New, scheduled for that day, or need to be re-reviewed.

Devour is a clone of Anki built on Rails and Backbone. Users can:

- [x] Create accounts
- [x] Create sessions (log in)
- [x] Create decks
- [x] Create flashcards
- [x] Memorize flashcards efficiently
- [x] Test themselves daily
- [x] View data of their progress
- [ ] Tag decks
- [x] Share decks with other users
- [x] Search through a public database for other decks to import
- [ ] See other users' progress
- [x] Have competitions to learn the most flashcards

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

The (original) SuperMemo-2 algorithm:

1. Split knowledge into smallest possible items.
2. With all items, associate an initial Easiness-Factor (EF) to 2.5.
3. Start repetitions:

  Time until next repetition(I):
    I(1) = 1;
    I(2) = 6;
    if (n > 2)
      I(n) = I(n-1) * EF
4. Assess quality of response: 0-5
5. Assess easiness of the flashcard, based on previous data and
 response from user:

  Easiness Factor(EF):
    EF' = EF + (.1-(5-q)(0.08 + 0.02(5-q)))

6. If the user's response is less than 3, we start repetitions from the
beginning, i.e. use I(1) and I(2).
7. After each repetition session, repeat all items that scored below 2 until
they score 2.

I'll figure out a way to make the learning process "easier" for users, by
improving the presentation of the cards, allowing them to be more alive. This
may be implemented by adding features that mimic a "working environment" for
the subject they are currently studying. For instance, if the User is studying
Biology, then making the background mimic the natural environment and create
animal noises. This would likely be implemented by allowing the user to choose
between general deck "themes" which would add additional animation and features.
Additionally, I want to allow users to input the answer and determine whether
they wrote it correctly.

### Bonus Features (TBD)
- [ ] "Like" button and counter for decks
- [ ] Pagination/infinite scroll
- [ ] Activity history (e.g. likes, comments, taggings)
- [ ] Tweets that display User progress
- [ ] Multiple sessions/session management
- [ ] User avatars
- [ ] Typeahead search bar

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
