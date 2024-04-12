# frozen_string_literal: true

class ScoresBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :score, :user_id, :game_id
    end
end
