# frozen_string_literal: true

class GamesBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :name, :user_id
    end
    
end
