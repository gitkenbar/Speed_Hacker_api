# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id 
    
    view :me do
        fields :username
    end

    view :normal do
        fields :username
    end

    view :profile do
        association :games, blueprint: GamesBlueprint
    end
end
