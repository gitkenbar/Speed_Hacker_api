# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
bigBang = Time.now;

# Create Users

    admin = User.create(
        username: "admin",
        password: "password"
    )
  
    5.times do |i|
        user = User.create(
            username: Faker::Internet.username(specifier: 3..10, separators: %w(_)),
            password: 'password'
            );     
    end

    user = User.find_by(id: 2)

# Create Contents

ezpz = Content.create(
    # 'Bad' example, this format is used for multi-word inputs
    # this should be a %w array
    challenge: ["a","b","c","d","e"]
)

alphabet = Content.create(
    challenge: %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
)

foxy = Content.create(
    challenge: %w[The very swift fox jumps over the lazy dog]
)

fruitAlphabet = Content.create(
    challenge: %w[
        Apple Banana Cherry DragonFruit Elderberry Fig Gooseberry Honeydew Ita Palm Java-Apple Kiwi Lemon Mango Nectarine Orange Pomegranate Quince Raspberry Strawberry Tomato Uglifruit Vanilla Watermelon Xigua Yuzu Zucchini
    ]
)

vege_alphabet = Content.create(
    challenge: %w[
        Aubergine Broccoli Carrot Daikon Radish Edamame Fennel Garlic Horseradish Iceburg Lettuce Jalapeno Kale Leek Mushroom Napa Cabbage Onion Pumpkin Queen Radish Squash Turnip Underground Viking Watercress XRay Yam Zucchini
    ]
)

5.times do |i|
    Content.create(
        challenge: [Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence]
        );
    end

# Create Games

admin.games.create(
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

fruitAlphabetGame = user.games.create(
    name: "FruitAlphabet",
    content_id: 4
)

vegeAlphabet_game = user.games.create(
    name: "Veg Alphabet",
    content_id: 5
)

userGames = user.games.create(
    name: Faker::Lorem.sentence,
    content_id: 3,
    user_id: 3
    );

    
 # Create Scores
    
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