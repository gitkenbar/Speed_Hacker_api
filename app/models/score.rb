class Score < ApplicationRecord
    #validators
    validates :score, presence:true
    validates :game_id, presence:true

    #associations
    has_one :user
    belongs_to :game
end
