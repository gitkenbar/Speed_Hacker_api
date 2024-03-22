# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.create(
    username: "test",
    password: "password"
    )
    
bigBang = Time.now;

15.times do |i|
    
    Content.create(
            challenge: [Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence]
            );
end


15.times do |i|
    user = User.create(
        username: Faker::Internet.username(specifier: 3..10, separators: %w(_)),
        password: 'password'
    );



    userGames = user.games.create(
        name: Faker::Lorem.sentence,
        content_id: 1,
        user_id: user.id
        );
end