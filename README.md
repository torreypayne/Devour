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

## Minimum Viable Product
Devour is a clone of Anki built on Rails and Backbone. Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [x] Create accounts
- [x] Create sessions (log in)
- [x] Create decks
- [x] Create flashcards
- [x] Memorize flashcards efficiently
- [x] Test themselves daily
- [ ] View data of their progress
- [ ] Tag decks
- [x] Share decks with other users
- [x] Search through a public database for other decks to import
- [ ] See other users' progress
- [ ] Have competitions to learn the most flashcards

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Deck Creation (~1 day) Update: DONE
I will implement user authentication in Rails based on the practices learned at
App Academy. By the end of this phase, users will be able to create flashcards using
a simple text form in a Rails view. The most important part of this phase will
be pushing the app to Heroku and ensuring that everything works before moving on
to phase 2.

[Details][phase-one]

### Phase 2: Viewing Decks and Cards (~2 days) Update: DONE
I will add API routes to serve deck and flashcard data as JSON, then add Backbone
models and collections that fetch data from those routes. By the end of this
phase, users will be able to create decks and view both decks and flashcards, all
inside a single Backbone app.

[Details][phase-two]

### Phase 3: Learning New Information (~2-3 days) Update: DONE
I plan to utilize the SM-2 Algorithm (originally designed by P.A. Wozniak) to
allow users to memorize their flashcards. The algorithm:

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

[Details][phase-three]

### Phase 4: Sharing Decks (~1 day) Update: DONE
I'll allow users to share decks with other users. This will be done by allowing
users to see each other in the Users index, and allowing a simple share by
utilizing a DeckShares association table.

[Details][phase-four]

### Phase 5: Searching for New Decks (~1 day) Update: DONE
I'll need to add `search` routes to both the Decks controllers. On the
Backbone side, there will be a `SearchResults` composite view that has
`Deck` subviews. These views will contain card collections, but they will fetch
from the new `search` routes.

[Details][phase-five]

### Bonus Phase 6: Making it easier to learn Cards (~1 day) Update: In progress
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
