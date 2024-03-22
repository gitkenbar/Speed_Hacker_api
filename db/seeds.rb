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
testgame = admin.games.create(
    name: "ezpz",
    content_id: 1,
    user_id: 1
    )

5.times do |i|
    user = User.create(
        username: Faker::Internet.username(specifier: 3..10, separators: %w(_)),
        password: 'password'
        );     
end

user = User.find_by(id: 2)
    
archer = Content.create(
    challenge: [
        Faker::TvShows::Archer.quote, Faker::TvShows::Archer.quote, Faker::TvShows::Archer.quote, Faker::TvShows::Archer.quote, Faker::TvShows::Archer.quote
    ])

archerGame = user.games.create(
    name: "Archer",
    content_id: 1,
    user_id: 2
    );

dune = Content.create(
    challenge: [
        Faker::Books::Dune.quote, Faker::Books::Dune.quote, Faker::Books::Dune.quote, Faker::Books::Dune.quote, Faker::Books::Dune.quote
    ])  

duneGame = user.games.create(
    name: Faker::Lorem.sentence,
    content_id: 2,
    user_id: 1
    );
             
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