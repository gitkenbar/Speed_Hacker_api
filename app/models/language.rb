class Language < ApplicationRecord
    validates :name, presence:true

    has_many :users
    has_many :games
end
