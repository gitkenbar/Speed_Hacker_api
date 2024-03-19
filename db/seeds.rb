# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

(3..7).each do |i|
    bigBang = Time.now;
    user = User.create(
        username: Faker::Internet.username(specifier: 3..10, separators: %w(_)),
        password: 'password'
    );

    Content.create(
            challenge: "success"#Faker::Lorem.sentence
            );

            
    userGames = user.games.create(
        name: Faker::Lorem.sentence,
        content_id: 1,
        user_id: user.id
        );
end