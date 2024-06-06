# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
bigBang = Time.now;

admin = User.create(
    username: "test",
    password: "password"
    )
    
ezpz = Content.create(
    challenge: ["a","b","c","d","e"]
)

alphabet = Content.create(
    challenge: %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
)

foxy = Content.create(
    challenge: %w[The very swift fox jumps over the lazy dog]
)

testgame = admin.games.create(
    name: "ezpz",
    content_id: 1
    )

admin.games.create(
    name: "Full Alphabet",
    content_id: 2
    )
admin.games.create(
    name: "Foxy",
    content_id: 3
)

5.times do |i|
    user = User.create(
        username: Faker::Internet.username(specifier: 3..10, separators: %w(_)),
        password: 'password'
        );     
end

user = User.find_by(id: 2)

dune = Content.create(
    challenge: [
        Faker::Books::Dune.quote, Faker::Books::Dune.quote, Faker::Books::Dune.quote, Faker::Books::Dune.quote, Faker::Books::Dune.quote
    ])  

fruitAlphabet = Content.create(
    challenge: [
        "Apple", "Banana", "Cherry", "DragonFruit", "Elderberry", "Fig", "Gooseberry", "Honeydew", "Ita Palm", "Java Apple", "Kiwi", "Lemon", "Mango", "Nectarine", "Orange", "Pomegranate", "Quince", "Raspberry", "Strawberry", "Tomato", "Uglifruit", "Vanilla", "Watermelon", "Xigua", "Yuzu", "Zucchini"
    ]
)

duneGame = user.games.create(
    name: Faker::Lorem.sentence,
    content_id: 2
    );

fruitAlphabetGame = user.games.create(
    name: "FruitAlphabet",
    content_id: 4
)

             
5.times do |i|
    Content.create(
        challenge: [Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence]
        );
    end

userGames = user.games.create(
    name: Faker::Lorem.sentence,
    content_id: 3,
    user_id: 3
    );

5.times do |i|
    Score.create(
        score: i,
        user_id: i,
        game_id: i
    )
end

Score.create(
    score: 1,
    user_id: 1,
    game_id: 1
)
Score.create(
    score: 2,
    user_id: 1,
    game_id: 1
)
Score.create(
    score: 3,
    user_id: 1,
    game_id: 1
)